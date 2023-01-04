set -e

if [ "$1" = "-v" ]; then
    out=/dev/stdout
else
    out=/dev/null
fi

os=$(uname)
if [ "$os" = "Linux" ]; then
    bin="$(pwd)"/bin/"$os"/"$(uname -m)"
else
    bin="$(pwd)"/bin/"$os"
fi
boot="$(pwd)"/boot

echo "[*] Pwning device..."
"$bin"/gaster pwn &> "$out" 
"$bin"/gaster reset &> "$out"

echo "[*] Booting device..."
"$bin"/irecovery -f "$boot"/iBSS.img4 &> "$out"
"$bin"/irecovery -f "$boot"/ibot.img4 &> "$out"

echo "[*] Done! The device will now boot to iOS"
