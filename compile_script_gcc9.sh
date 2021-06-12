mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper
export CROSS_COMPILE=/home/andrea/android/toolchains-64/proton-gcc9/bin/aarch64-elf-
make O=out lineage_flounder_defconfig
make O=out -j$(nproc --all)

echo
echo "Making anykernel zip"
echo
cp ./out/arch/arm64/boot/Image.gz-dtb ./AnyKernel3/
cd ./AnyKernel3
zip -r9 Pop_kernel-flounder-O-rx-x.zip * -x .git README.md *placeholder
