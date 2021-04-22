

# Callbacks to explore async driver on Postgres Rust driver

```typedef intptr_t (*IntptrBinOp)(intptr_t a, intptr_t b);```
https://github.com/dart-lang/sdk/blob/77dc74bcd57b8c3b0d1a67737275fb2206e46aeb/runtime/bin/ffi_test/ffi_test_functions.cc#L573

```C
// Applies an intptr binop function to 42 and 74.
// Used for testing passing a function pointer to C.
DART_EXPORT intptr_t ApplyTo42And74(IntptrBinOp binop) {
  std::cout << "ApplyTo42And74()\n";
  intptr_t retval = binop(42, 74);
  std::cout << "returning " << retval << "\n";
  return retval;
}
```
https://github.com/dart-lang/sdk/blob/77dc74bcd57b8c3b0d1a67737275fb2206e46aeb/runtime/bin/ffi_test/ffi_test_functions.cc#L588

```
////////////////////////////////////////////////////////////////////////////////
// Tests for callbacks.

// Sanity test.
DART_EXPORT intptr_t TestSimpleAddition(intptr_t (*add)(int, int)) {
  const intptr_t result = add(10, 20);
  std::cout << "result " << result << "\n";
  CHECK_EQ(result, 30);
  return 0;
}
```

## Use take mut

https://docs.rs/take_mut/0.2.2/take_mut/

## Calback with Struct
```

// Can't easily share this with the generated file.
struct Struct4BytesHomogeneousInt16Copy {
  int16_t a0;
  int16_t a1;
};

// Can't easily share this with the generated file.
struct Struct8BytesNestedIntCopy {
  Struct4BytesHomogeneousInt16Copy a0;
  Struct4BytesHomogeneousInt16Copy a1;
};

DART_EXPORT void CallbackWithStruct(void (*f)(Struct8BytesNestedIntCopy)) {
  std::cout << "CallbackWithStruct"
            << "(" << reinterpret_cast<void*>(f) << ")\n";

  Struct8BytesNestedIntCopy arg;
  arg.a0.a0 = 10;
  arg.a0.a1 = 11;
  arg.a1.a0 = 12;
  arg.a1.a1 = 13;

  f(arg);
}
```
https://github.com/dart-lang/sdk/blob/77dc74bcd57b8c3b0d1a67737275fb2206e46aeb/runtime/bin/ffi_test/ffi_test_functions.cc#L798

## Callback async calling Dart from C

Does not really works while issue https://github.com/dart-lang/sdk/issues/37022 is open.

See next section to rely on dart native port.(https://github.com/dart-lang/sdk/blob/master/samples/ffi/async/sample_native_port_call.dart)

https://github.com/dart-lang/sdk/blob/master/samples/ffi/async/sample_async_callback.dart



## Another callback approach - More verbose

https://github.com/dart-lang/sdk/blob/master/samples/ffi/async/sample_native_port_call.dart

