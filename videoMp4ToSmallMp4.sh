#!/bin/bash
# optimize_video.sh
# 사용법: ./optimize_video.sh input.mp4 output.mp4

INPUT="$1"
OUTPUT="$2"

if [[ -z "$INPUT" || -z "$OUTPUT" ]]; then
    echo "Usage: $0 input.mp4 output.mp4"
    exit 1
fi

# 1. 해상도 640px 너비로 축소 (세로는 자동 유지)
# 2. 프레임률 15fps로 줄임
# 3. CRF 28로 품질 조정 (값 ↑ → 용량↓ / ↓ → 화질↑)
# 4. H.264 코덱, 호환성 위해 yuv420p
ffmpeg -i "$INPUT" -vf "scale=640:-1,fps=15" \
    -c:v libx264 -preset slow -crf 28 -pix_fmt yuv420p "$OUTPUT"

echo "Optimized video saved to $OUTPUT"

