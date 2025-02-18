# Saketo

Saketo is a mobile Monero wallet. It isn't based on any existing wallet and is written from scratch. It is written in Dart and uses the Flutter framework.

The first mobile Monero wallet that uses Rust to handle Monero transactions.

# Building

To build Saketo, you need to have Flutter installed. You can find instructions on how to install Flutter [here](https://flutter.dev/docs/get-started/install).

You also need to build external libraries. To do this, you can run the following commands:
1 - Fetch submodules:
```bash
git submodule update --init --recursive
```
2 - Build the libraries:
```bash
cargo ndk -t arm64-v8a -t armeabi-v7a -o ./../android/app/src/main/jniLibs build --release
```

Then you can build or run the app in Android Studio.