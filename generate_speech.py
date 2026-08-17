import csv
import asyncio
import os
import subprocess
import argparse
import edge_tts

async def generate_speech(text, output_wav, voice):
    mp3_tmp = output_wav.replace(".wav", ".mp3")
    
    # Sintesi vocale tramite Edge-TTS
    communicate = edge_tts.Communicate(text, voice)
    await communicate.save(mp3_tmp)
    
    # Conversione MP3 -> WAV 16kHz Mono per Roborock/Xiaomi
    subprocess.run([
        "ffmpeg", "-y", "-i", mp3_tmp, 
        "-ar", "16000", "-ac", "1", output_wav
    ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    if os.path.exists(mp3_tmp):
        os.remove(mp3_tmp)

async def main():
    parser = argparse.ArgumentParser(description="Genera file audio WAV per Roborock usando Edge-TTS")
    parser.add_argument("--csv", default="audio.csv", help="File CSV con la mappatura dei testi (default: audio.csv)")
    parser.add_argument("--voice", default="it-IT-IsabellaNeural", help="Voce Edge-TTS da usare (es. it-IT-IsabellaNeural, en-US-AvaNeural)")
    parser.add_argument("--output", default="output/speech", help="Cartella di destinazione dei WAV")
    
    args = parser.parse_args()

    os.makedirs(args.output, exist_ok=True)

    if not os.path.exists(args.csv):
        print(f"Errore: File '{args.csv}' non trovato!")
        return

    print(f"-> Uso file CSV: {args.csv}")
    print(f"-> Voce selezionata: {args.voice}")

    with open(args.csv, mode="r", encoding="utf-8") as f:
        reader = csv.reader(f)
        for row in reader:
            if not row:
                continue
            filename, text = row[0], row[1]
            out_path = os.path.join(args.output, filename)
            
            if not os.path.exists(out_path):
                print(f"Generazione: {filename} -> '{text}'")
                await generate_speech(text, out_path, args.voice)
            else:
                print(f"Già presente: {filename}")

if __name__ == "__main__":
    asyncio.run(main())