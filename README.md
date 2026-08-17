Basato sul roborock glados (https://github.com/arner/roborock-glados) di Arner (https://github.com/arner) 

# Roborock Language Pack Generator

Un generatore generico di pacchetti vocali `.pkg` per **Xiaomi Mi Robot Vacuum (Gen1 e dispositivi **Roborock**, basato sulla sintesi vocale ad alta qualità di **Microsoft Edge Neural TTS**.

## Prerequisiti

- Python 3.8+
- `ffmpeg` installato nel sistema

## Installazione 
### Clona il repository ed entra nella cartella:
```bash
git clone https://github.com/alebrescia/Roborock-languagepack-generator.git
cd Roborock-languagepack-generator
```
### Installazione Dipendenze
```bash
# Installa i pacchetti necessari (FFmpeg è indispensabile per la conversione WAV 16kHz)
sudo apt update && sudo apt install -y ffmpeg python3-venv git && sudo apt install -y ccrypt

# Crea e attiva l'ambiente virtuale Python
python3 -m venv venv
source venv/bin/activate

# Installa la libreria di sintesi vocale
pip install edge-tts
```
### Permessi di esecuzione file
```bash
chmod +x build.sh
```
### Uso Rapido
Modifica o sostituisci il file audio.csv inserendo le frasi tradotte nella tua lingua.
Esegui lo script di build specificando Voce, File CSV e Nome output:
```bash
./build.sh <VOCE_EDGE_TTS> <FILE_CSV> <NOME_PKG_OUTPUT>
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
### Risultato
Al termine dell' esecuzione dello script, verrà creato il pkg da usare nel roborock corredato da calcolo hash del file 
(Visibile in console e presente nella cartella "dist" )

### Creazione webserver "al volo"
```bash
python3 -m http.server 8000
```
Link da usare in valetudo
```bash
http://<IL TUO IP>:8000/dist/<PACKAGE_NAME>.pkg
```
