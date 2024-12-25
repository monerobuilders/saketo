use polyseed;
use std::ffi::CString;
use std::os::raw::c_char;

#[no_mangle]
extern "C" fn generate_seed() -> *mut c_char {
    let seed = polyseed::Polyseed::new(&mut rand::rngs::OsRng, polyseed::Language::English);
    let c_string = CString::new(seed.to_string().to_string()).unwrap();
    c_string.into_raw() // Move ownership of the string to the caller
}

#[no_mangle]
extern "C" fn free_c_string(s: *mut c_char) {
    if s.is_null() { return; }
    unsafe {
        let _ = CString::from_raw(s); // Convert the pointer back and let Rust drop it
    }
}