branch=$(git symbolic-ref --short HEAD)
branch_name=$(git rev-parse --abbrev-ref HEAD)
last_commit=$(git rev-parse --verify --short=8 HEAD)
export LOCALVERSION="-Armonia-Kernel-${branch_name}/${last_commit}"

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper
export CROSS_COMPILE="$HOME"/android/toolchains/proton-gcc9/bin/aarch64-elf-
make O=out lineage_flounder_defconfig
make O=out -j$(nproc --all)

echo
echo "Making anykernel zip"
echo
cp ./out/arch/arm64/boot/Image.gz-dtb ./AnyKernel3/
cd ./AnyKernel3
rm *.zip
zip -r9 Armonia_kernel-flounder-O-${branch_name}-${last_commit}.zip * -x .git README.md *placeholder
