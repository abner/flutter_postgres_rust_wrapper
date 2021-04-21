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

