#!/usr/bin/env bash
echo "=== 16 Standard & High-Intensity ANSI Colors ==="
for i in {0..15}; do
    printf "\e[48;5;%dm  %3d  \e[0m" $i $i
    if [ $(( (i + 1) % 8 )) -eq 0 ]; then echo ""; fi
done
echo ""
echo "=== 6x6x6 Color Cube (Indices 16 to 231) ==="
for i in {16..231}; do
    printf "\e[48;5;%dm  %3d  \e[0m" $i $i
    if [ $(( (i - 15) % 6 )) -eq 0 ]; then echo ""; fi
done
echo ""
echo "=== Grayscale Ramp (Indices 232 to 255) ==="
for i in {232..255}; do
    printf "\e[48;5;%dm  %3d  \e[0m" $i $i
    if [ $(( (i - 231) % 8 )) -eq 0 ]; then echo ""; fi
done
echo ""
