#!/bin/bash
set -e

# Configurazione predefinita (modificabile via argomenti)
VOICE="${1:-it-IT-IsabellaNeural}"
CSV_FILE="${2:-audio.csv}"
OUTPUT_NAME="${3:-custom_voicepack}"

echo "=== 1. Generazione file audio WAV ==="
python3 generate_speech.py --voice "$VOICE" --csv "$CSV_FILE"

echo "=== 2. Impacchettamento .pkg per Xiaomi/Roborock ==="
mkdir -p dist
cd output/speech
tar -czvf "../../dist/${OUTPUT_NAME}.pkg" *.wav
cd ../..

echo "=== 3. Calcolo Hash MD5 ==="
md5sum "dist/${OUTPUT_NAME}.pkg" | awk '{print $1}' > "dist/${OUTPUT_NAME}.pkg.md5"

echo ""
echo "=== COMPLETATO ==="
echo "Pacchetto creato in: dist/${OUTPUT_NAME}.pkg"
echo -n "MD5 Hash: "
cat "dist/${OUTPUT_NAME}.pkg.md5"
echo ""