import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final DynamicLibrary rustLib = Platform.isAndroid
    ? DynamicLibrary.open("libsaketo_rust.so")
    : (Platform.isIOS
        ? DynamicLibrary.process()
        : DynamicLibrary.open("libsaketo_rust.dylib"));

final Pointer<Utf8> Function() generateSeed = rustLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>("generate_seed")
    .asFunction();

final void Function(Pointer<Utf8>) freeCString = rustLib
    .lookup<NativeFunction<Void Function(Pointer<Utf8>)>>("free_c_string")
    .asFunction();

String generateSeedString() {
  final Pointer<Utf8> seedPointer = generateSeed();
  final String seed = seedPointer.toDartString(); // Convert to Dart String
  freeCString(seedPointer); // Free the allocated memory
  return seed;
}
