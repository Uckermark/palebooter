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
"$bin"/gaster pwn 2&>1 "$out" 
"$bin"/gaster reset 2&>1 "$out"

echo "[*] Booting device..."
"$bin"/irecovery -f "$boot"/iBSS.img4 2&>1 "$out"
"$bin"/irecovery -f "$boot"/ibot.img4 2&>1 "$out"

echo "[*] Done!"
echo "    The device should now boot to iOS"
