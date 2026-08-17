Basato sul roborock glados (https://github.com/arner/roborock-glados) di Arner (https://github.com/arner) 

# Roborock Language Pack Generator

Un generatore generico di pacchetti vocali `.pkg` per **Xiaomi Mi Robot Vacuum (Gen1 e dispositivi **Roborock**, basato sulla sintesi vocale ad alta qualità di **Microsoft Edge Neural TTS**.

## Prerequisiti

- Python 3.8+
- `ffmpeg` installato nel sistema

### Installazione Dipendenze
```bash
pip install edge-tts
sudo apt-get install -y ffmpeg
```
### Uso Rapido
Modifica o sostituisci il file audio.csv inserendo le frasi tradotte nella tua lingua.
Esegui lo script di build specificando Voce, File CSV e Nome output:
```bash
./build.sh <VOCE_EDGE_TTS> <FILE_CSV> <NOME_OUTPUT>
```
ESEMPI:
```bash
./build.sh "it-IT-IsabellaNeural" "audio.csv" "italian_isabella"
./build.sh "en-US-AvaNeural" "audio_en.csv" "english_ava"
./build.sh "de-DE-KillianNeural" "audio_de.csv" "german_killian"
```
### Lista Voci disponibili
```bash
edge-tts --list-voices
```
