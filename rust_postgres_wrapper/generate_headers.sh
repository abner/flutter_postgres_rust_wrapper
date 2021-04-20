#!/bin/bash

cbindgen --config cbindgen.toml --crate rust_postgres_wrapper --lang c --output rust_postgres_wrapper.h
