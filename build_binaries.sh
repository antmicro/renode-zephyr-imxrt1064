#!/bin/bash -xeu

export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_BASE=$(pwd)/zephyr/zephyr
export ZEPHYR_SDK_INSTALL_DIR=$(pwd)/zephyr/sdk

mkdir -p artifacts

pushd $ZEPHYR_BASE/samples/hello_world
cp prj.conf prj-no-mpu.conf
echo "CONFIG_ARM_MPU=n" >> prj-no-mpu.conf
west build -p auto -b mimxrt1064_evk -- -G'Unix Makefiles' -DCONF_FILE=prj-no-mpu.conf
popd
cp $ZEPHYR_BASE/samples/hello_world/build/zephyr/zephyr.elf artifacts/zephyr-hello_world.elf

pushd $ZEPHYR_BASE/samples/subsys/shell/shell_module
cp prj.conf prj-no-mpu.conf
echo "CONFIG_ARM_MPU=n" >> prj-no-mpu.conf
west build -p auto -b mimxrt1064_evk -- -G'Unix Makefiles' -DCONF_FILE=prj-no-mpu.conf
popd
cp $ZEPHYR_BASE/samples/subsys/shell/shell_module/build/zephyr/zephyr.elf artifacts/zephyr-shell_module.elf
