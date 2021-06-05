mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper
export CROSS_COMPILE=/home/andrea/android/aarch64-linux-android-4.9/bin/aarch64-linux-android-
make O=out lineage_flounder_defconfig
make O=out -j$(nproc --all)
