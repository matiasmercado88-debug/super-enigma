#!/usr/bin/env bash
# subset-font.sh — subset a font to a language range and output web-ready woff2.
#
# A full display face ships thousands of glyphs a landing uses ~120 of. This trims it to the
# characters you need and outputs woff2. Default range: Latin + Latin-Extended-A + common
# punctuation + € + a set of star/sparkle glyphs (★ ✦ ✳ ✶ ✺ ❋) commonly used as devices.
# Covers Spanish incl. ñ/á/é/í/ó/ú/ü.
#
# Usage:
#   ./subset-font.sh <font.ttf|otf> [out.woff2] [unicode-range]
# Examples:
#   ./subset-font.sh LeMurmure.ttf
#   ./subset-font.sh Syne.ttf syne-subset.woff2 "U+0000-00FF,U+2605,U+2726"
#
# Requires fonttools + brotli:  pip install fonttools brotli
# See references/optimization.md for glyphhanger (auto-detects glyphs from built HTML).

set -euo pipefail

IN="${1:?usage: subset-font.sh <font.ttf|otf> [out.woff2] [unicode-range]}"
OUT="${2:-${IN%.*}-subset.woff2}"
# Latin + Latin-Ext-A + punctuation + € + ™ + stars/sparkles (2605,2726,2733,2736,273A,273B,273F,2749,274B,2756)
RANGE="${3:-U+0000-00FF,U+0100-017F,U+2000-206F,U+20AC,U+2122,U+2605,U+2726,U+2733,U+2736,U+273A,U+273F,U+2749,U+2756}"

python3 -c "import fontTools" 2>/dev/null || { echo "Missing: fonttools (pip install fonttools brotli)"; exit 1; }

pyftsubset "$IN" \
  --unicodes="$RANGE" \
  --layout-features='kern,liga,calt,onum,tnum,frac' \
  --flavor=woff2 --desubroutinize \
  --output-file="$OUT"

in_kb=$(( ($(stat -c%s "$IN")  + 1023) / 1024 ))
out_kb=$(( ($(stat -c%s "$OUT") + 1023) / 1024 ))
echo "  ✓ $IN (${in_kb} KB)  →  $OUT (${out_kb} KB)"
echo "Reminder: @font-face with font-display:swap, and preload only the LCP/hero display face."
