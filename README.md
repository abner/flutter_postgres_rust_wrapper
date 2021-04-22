# Binding Rust to allow Flutter call postgres


## Creates the dart ffi bindings:

```bash
dart run ffigen
```


## Execute passing path of the dynamic library

**Dart Binary**
```
LD_LIBRARY_PATH=$PWD/rust_postgres_wrapper/target/release bin/main.exe
```

**Flutter on Linux**
```
LD_LIBRARY_PATH=$PWD/rust_postgres_wrapper/target/release flutter run -t lib/main.dart
```


## Generate binding to Mobile

See Makefile under folder rust_psotgres_wrapper, borrowed from https://github.com/brickpop/flutter-rust-ffi/blob/master/rust/makefile

https://github.com/brickpop/flutter-rust-ffi


## Generate headers from rust code to be consumed by ffigen

https://github.com/eqrion/cbindgen

See [cbindgen.toml](rust_postgres_wrapper/cbindgen.toml) on rust_postgres_wrapper folder.


* Alternative, not explored: https://docs.rs/moz-cheddar/0.4.2/cheddar/