#!/bin/bash
# 사용법: ./mp4_to_gif.sh input.mp4 output.gif

INPUT=$1
OUTPUT=$2

if [ -z "$INPUT" ] || [ -z "$OUTPUT" ]; then
    echo "Usage: $0 input.mp4 output.gif"
    exit 1
fi

# 1단계: 팔레트 생성 (색상 최적화용)
ffmpeg -y -i "$INPUT" -vf "fps=15,scale=320:-1:flags=lanczos,palettegen" palette.png

# 2단계: 팔레트 기반으로 GIF 변환
ffmpeg -i "$INPUT" -i palette.png -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" -y "$OUTPUT"

# 완료 후 임시 팔레트 삭제
rm -f palette.png

echo "✅ 변환 완료: $OUTPUT"

