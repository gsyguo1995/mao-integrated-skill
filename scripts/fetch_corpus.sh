#!/usr/bin/env bash
# Fetch the Selected Works corpus (Mao Xuan vols 1-7) into knowledge/
# Vols 1-5: official. Vols 6-7: unofficial "Jinghuo" compilation.
set -euo pipefail

REPO_ZIP="https://codeload.github.com/NpTIme/MaoZeDongAnthology/zip/refs/heads/main"
DEST="$(cd "$(dirname "$0")/.." && pwd)/knowledge"
TMP="$(mktemp -d)"

echo "[*] Downloading corpus (~3.5MB)..."
curl -sSL --ssl-no-revoke -o "$TMP/corpus.zip" "$REPO_ZIP"
unzip -q -o "$TMP/corpus.zip" -d "$TMP"
SRC="$TMP/MaoZeDongAnthology-main"

echo "[*] Installing into $DEST ..."
mkdir -p "$DEST/selected_works_第五卷" \
         "$DEST/selected_works_第六卷_静火版" \
         "$DEST/selected_works_第七卷_静火版"
cp "$SRC/005-第五卷 社会主义革命和社会主义建设时期（一）"/*.md \
   "$DEST/selected_works_第五卷/"
cp "$SRC/006-第六卷 社会主义革命和社会主义建设时期（二）【非官方版本】"/*.md \
   "$DEST/selected_works_第六卷_静火版/" 2>/dev/null || true
cp "$SRC/007-第七卷 文化大革命时期【非官方版本】"/*.md \
   "$DEST/selected_works_第七卷_静火版/" 2>/dev/null || true

for d in "$DEST"/selected_works_*; do
  echo "    $(basename "$d"): $(ls "$d" | wc -l) files"
done
rm -rf "$TMP"
echo "[✓] Done. Vols 6-7 are unofficial compilations — verify quotations."
