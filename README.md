# EN
#### Based on <a href="https://github.com/arner/roborock-glados">roborock glados</a> by <a href="https://github.com/arner">Arner</a>

# Roborock Language Pack Generator

A generic `.pkg` voice pack generator for **Xiaomi Mi Robot Vacuum (Gen1)** and **Roborock** devices, based on high-quality neural speech synthesis from **Microsoft Edge Neural TTS**.

## Prerequisites

- Python 3.8+
- `ffmpeg` 
- `ccrypt`

## Installation 
### Clone the repository and enter the folder:
```bash
git clone https://github.com/alebrescia/Roborock-languagepack-generator.git
cd Roborock-languagepack-generator
```
### Installing Dependencies
```bash
# Install required packages (FFmpeg is essential for 16kHz WAV conversion)
sudo apt update && sudo apt install -y ffmpeg python3-venv git && sudo apt install -y ccrypt

# Create and activate the Python virtual environment
python3 -m venv venv
source venv/bin/activate

# Install the speech synthesis library
pip install edge-tts
```
### File Execution Permissions
```bash
chmod +x build.sh
```
### Quick Usage
Edit or replace the audio.csv file with the translated phrases in your language.
Run the build script specifying Voice, CSV File, and Output Name:
```bash
./build.sh <EDGE_TTS_VOICE> <CSV_FILE> <OUTPUT_PKG_NAME>
```
EXAMPLES:
```bash
./build.sh "it-IT-IsabellaNeural" "audio_ita.csv" "italian_isabella"
./build.sh "en-US-AvaNeural" "audio.csv" "english_ava"
./build.sh "de-DE-KillianNeural" "audio_de.csv" "german_killian"
```
### List of Available Voices
```bash
edge-tts --list-voices
```
### Result
Upon completion of the script execution, the pkg to be used in the roborock will be created, accompanied by the file hash calculation 
(Visible in the console and saved in the "dist" folder)

### On-the-fly Web Server Creation
```bash
python3 -m http.server 8000
```
Link to use in Valetudo
```bash
http://<YOUR_IP>:8000/dist/<PACKAGE_NAME>.pkg
```



# ITA
#### Basato su <a href="https://github.com/arner/roborock-glados">roborock glados</a> di <a href="https://github.com/arner">Arner</a>

# Roborock Language Pack Generator

Un generatore generico di pacchetti vocali `.pkg` per **Xiaomi Mi Robot Vacuum (Gen1 e dispositivi **Roborock**, basato sulla sintesi vocale ad alta qualità di **Microsoft Edge Neural TTS**.

## Prerequisiti

- Python 3.8+
- `ffmpeg` 
- `ccrypt`

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
./build.sh "it-IT-IsabellaNeural" "audio_ita.csv" "italian_isabella"
./build.sh "en-US-AvaNeural" "audio.csv" "english_ava"
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
