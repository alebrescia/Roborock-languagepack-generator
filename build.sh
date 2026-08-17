#!/bin/bash
set -e

VOICE="${1:-it-IT-IsabellaNeural}"
CSV_FILE="${2:-audio.csv}"
OUTPUT_NAME="${3:-custom_voicepack}"

# Verifica presenza di ccrypt
if ! command -v ccrypt &> /dev/null; then
    echo "Errore: 'ccrypt' non è installato. Installalo con: sudo apt install ccrypt"
    exit 1
fi

echo "=== 1. Generazione file audio WAV ==="
python3 generate_speech.py --voice "$VOICE" --csv "$CSV_FILE"

echo "=== 2. Creazione archivio TAR.GZ ==="
mkdir -p dist
cd output/speech
tar -czvf "../../dist/${OUTPUT_NAME}.tar.gz" *.wav
cd ../..

echo "=== 3. Cifratura CCRYPT (chiave: cleaner) ==="
# Cifra il file creando dist/${OUTPUT_NAME}.tar.gz.cpt
ccrypt -e -K "cleaner" "dist/${OUTPUT_NAME}.tar.gz"

# Rinomina il file cifrato .cpt nell'estensione finale .pkg
mv "dist/${OUTPUT_NAME}.tar.gz.cpt" "dist/${OUTPUT_NAME}.pkg"

echo "=== 4. Calcolo Hash MD5 ==="
md5sum "dist/${OUTPUT_NAME}.pkg" | awk '{print $1}' > "dist/${OUTPUT_NAME}.pkg.md5"

echo ""
echo "=== COMPLETATO ==="
echo "Pacchetto cifrato creato in: dist/${OUTPUT_NAME}.pkg"
echo -n "MD5 Hash: "
cat "dist/${OUTPUT_NAME}.pkg.md5"
echo ""
