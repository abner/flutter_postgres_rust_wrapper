# Binding Rust to allow Flutter call postgres


## Creates the dart ffi bindings:

```bash
dart run ffigen
```


## Execute passing path of the dynamic library

```
LD_LIBRARY_PATH=$PWD/rust_postgres_wrapper/target/release bin/main.exe
```


## Generate binding to Mobile

