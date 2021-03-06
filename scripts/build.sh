#!/usr/bin/env bash

# thumbv7em-none-eabihf is the default target if not specified
# (see ../.config/cargo)

set -e

echo Building nrf51-hal...
cargo build --manifest-path nrf51-hal/Cargo.toml --target thumbv6m-none-eabi
echo Building nrf9160-hal...
cargo build --manifest-path nrf9160-hal/Cargo.toml --target thumbv8m.main-none-eabi
echo Building nrf52810-hal...
cargo build --manifest-path nrf52810-hal/Cargo.toml --target thumbv7em-none-eabi
echo Building nrf52832-hal...
cargo build --manifest-path nrf52832-hal/Cargo.toml
echo Building nrf52833-hal...
cargo build --manifest-path nrf52833-hal/Cargo.toml
echo Building nrf52840-hal...
cargo build --manifest-path nrf52840-hal/Cargo.toml

echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml --no-default-features --features="51" --target thumbv6m-none-eabi
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml --no-default-features --features="52810" --target thumbv7em-none-eabi
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml --no-default-features --features="52840"
echo Building examples/spi-demo...
cargo build --manifest-path examples/spi-demo/Cargo.toml
echo Building examples/twi-ssd1306...
cargo build --manifest-path examples/twi-ssd1306/Cargo.toml
echo Building examples/twi-ssd1306...
cargo build --manifest-path examples/twi-ssd1306/Cargo.toml --no-default-features --features="52840" --target thumbv7em-none-eabi
echo Building examples/ecb-demo...
cargo build --manifest-path examples/ecb-demo/Cargo.toml --features=52832
echo Building examples/ccm-demo...
cargo build --manifest-path examples/ccm-demo/Cargo.toml --features=52832
echo Building examples/ppi-demo...
cargo build --manifest-path examples/ppi-demo/Cargo.toml --features=52832

echo Checking source code formatting...
cargo +stable fmt -- --check
