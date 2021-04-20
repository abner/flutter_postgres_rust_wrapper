#!/bin/bash

#cargo build --release && \
RUSTFLAGS='-C link-arg=-s' cargo build --release && \
/bin/bash ./generate_headers.sh && echo "OK"
