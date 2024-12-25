# Building External Libs

- Install Rust
- Install Cargo
- Install NDK
- Install required Rust targets:
```bash
rustup target add aarch64-linux-android armv7-linux-androideabi
```
- Install 'cargo-ndk':
```bash
cargo install cargo-ndk
```
- Fetch submodules:
```bash
git submodule update --init --recursive
```
- Build the library:
```bash
cd rust && cargo ndk -t arm64-v8a -t armeabi-v7a -o ./../android/app/src/main/jniLibs build --release
```
