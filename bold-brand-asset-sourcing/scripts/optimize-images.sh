#!/usr/bin/env bash
# optimize-images.sh — batch-convert raster assets (illustration exports, textures, photos)
# to web-ready AVIF + WebP, resized and metadata-stripped. Leaves originals untouched.
#
# For the bold look, prefer SVG for illustration/devices where possible — only run this on
# assets that must stay raster.
#
# Usage:   ./optimize-images.sh <src-dir> <out-dir> [max-width] [quality]
# Example: ./optimize-images.sh ./raw ./dist 1200 80
#
# Requires ImageMagick + cwebp + avifenc:
#   sudo apt-get install -y imagemagick webp libavif-bin
# (squoosh-cli and sharp are good alternatives — see references/optimization.md.)

set -euo pipefail

SRC="${1:?usage: optimize-images.sh <src-dir> <out-dir> [max-width] [quality]}"
OUT="${2:?usage: optimize-images.sh <src-dir> <out-dir> [max-width] [quality]}"
MAXW="${3:-1200}"
Q="${4:-80}"

command -v magick  >/dev/null || { echo "Missing: ImageMagick (magick)"; exit 1; }
command -v cwebp   >/dev/null || { echo "Missing: cwebp (webp package)";   exit 1; }
command -v avifenc >/dev/null || { echo "Missing: avifenc (libavif-bin)";  exit 1; }

mkdir -p "$OUT"; shopt -s nullglob nocaseglob
for f in "$SRC"/*.{jpg,jpeg,png,webp,tif,tiff}; do
  base="$(basename "${f%.*}")"; tmp="$(mktemp --suffix=.png)"
  magick "$f" -auto-orient -strip -resize "${MAXW}>" "$tmp"
  cwebp   -quiet -q "$Q" "$tmp" -o "$OUT/$base.webp"
  avifenc --min 20 --max 30 "$tmp" "$OUT/$base.avif" >/dev/null
  rm -f "$tmp"
  echo "  ✓ $base  →  $base.avif, $base.webp  (max ${MAXW}px)"
done
echo "Done → $OUT.  For responsive srcset, also export at 600/900 widths and set width/height in markup."
