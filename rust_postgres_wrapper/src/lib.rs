use std::os::raw::{c_char};
use std::ffi::{CString, CStr};
use postgres::{Client, NoTls};

#[no_mangle]
pub extern fn hello_rust(to: *const c_char) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(to) };
    let recipient = match c_str.to_str() {
        Err(_) => "there",
        Ok(string) => string,
    };

    CString::new("Hello ".to_owned() + recipient).unwrap().into_raw()
}


#[no_mangle]
pub extern fn rust_run_query(sql: *const c_char, port: i32) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(sql) };
    let sql = match c_str.to_str() {
        Err(_) => "select id, name, age from users;",
        Ok(string) => string,
    };
    let db_url_fromat = format!("host=localhost user=dart_postgres password=dart_postgres port={} dbname=dart_postgres", port);
    let db_url: &str = &*db_url_fromat;
    let mut client = Client::connect(db_url, NoTls).unwrap();

    
    let mut result = String::new();

    let res = client.query(sql, &[]).unwrap();
    
    for row in res {
        // let id: i32 = row.get(0);
        let name: &str = row.get(1);
        // let age: i32 = row.get(2);
        // let data: Option<&[u8]> = row.get(2);
        result.push_str("Found user: ");
        // let idString = id.to_string();
        result.push_str(name);
        result.push_str("\n");
        // result = format!("{}found user: {}, {}, {}\n", result.to_string(), id.to_string(), name.to_string(), age.to_string());
    }   
    CString::new(result.to_owned()).unwrap().into_raw()
}
