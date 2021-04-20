import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter_postgres_rust/flutter_postgres_rust.dart';

void main() {
  late flutter_postgres_rust fp;

  if (Platform.isLinux) {
    //fp = flutter_postgres_rust(DynamicLibrary.open('${Platform.environment['PWD']}/rust_postgres_wrapper/target/release/librust_postgres_wrapper.so'));
    fp = flutter_postgres_rust(DynamicLibrary.open('librust_postgres_wrapper.so'));
  } else if (Platform.isWindows) {
    fp = flutter_postgres_rust(DynamicLibrary.open('${Platform.environment['PWD']}/rust_postgres_wrapper/target/release/librust_postgres_wrapper.dll'));
  } else {
    throw 'Plataform not yet supported';
  }
  // Pointer arg = "Olá galera - vem retorno do Rust".toNativeUtf8();
  // Pointer<Int8> result = fp.hello_rust(arg.cast<Int8>());
  // print(result.cast<Utf8>().toDartString());

  Pointer arg = "Select id, name, age from users;".toNativeUtf8();
  try {
    Pointer<Int8> result = fp.rust_run_query(arg.cast<Int8>(), 32780);
    print(result.cast<Utf8>().toDartString());
  } catch (e) {
    print('ERROR: $e');
  }
}
