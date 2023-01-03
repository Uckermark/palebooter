set -e
os=$(uname)
if [ "$os" = "Linux" ]; then
    bin="$(pwd)"/bin/"$os"/"$(uname -m)"
else
    bin="$(pwd)"/bin/"$os"
fi
boot="$(pwd)"/boot

echo "[*] Pwning device..."
"$bin"/gaster pwn
"$bin"/gaster reset

echo "[*] Booting device..."
"$bin"/irecovery -f "$boot"/iBSS.img4
"$bin"/irecovery -f "$boot"/ibot.img4

echo "[*] Done!"
echo "    The device should now boot to iOS"
