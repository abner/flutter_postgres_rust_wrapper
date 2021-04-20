# Generate cbindings

```bash
cbindgen --config cbindgen.toml --lang c --crate rust_postgres_wrapper --output rust_postgres_wrapper.h
```


## Compile and generate cbindings

Runs script build.sh:

```bash
./build.sh
```

## Postgres connection with Pool

https://stackoverflow.com/questions/63150183/how-do-i-keep-a-global-postgres-connection

```rust

use r2d2_postgres::postgres::{NoTls, Client};
use r2d2_postgres::PostgresConnectionManager;

#[macro_use]
extern crate lazy_static;

lazy_static! {
    static ref POOL: r2d2::Pool<PostgresConnectionManager<NoTls>> = {
        let manager = PostgresConnectionManager::new(
            // TODO: PLEASE MAKE SURE NOT TO USE HARD CODED CREDENTIALS!!!
            "host=localhost user=postgres password=password".parse().unwrap(),
            NoTls,
        );
        r2d2::Pool::new(manager).unwrap()
    };
}



pub fn get_player(id: i32) {
    // Use global client connection object:
    let mut client = POOL.get().unwrap();
    for row in client.query("SELECT * FROM public.\"User\" WHERE \"accountID\"=$1;",&[&id]).unwrap(){
        let id: i32 = row.get(0);
        let name: &str = row.get(1);

        println!("found player: {} {}", id, name);
    }
}
```

## Handle postgres call Errors:

https://stackoverflow.com/q/63150183


## References:

* Documentation: https://rust-lang-nursery.github.io/rust-cookbook/database/postgres.html

* https://medium.com/@james_32022/basic-postgres-data-in-rust-6eb492591b7d