use polyseed::{self};
use monero_seed;
use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use rand::rngs::OsRng;

// --------------------------------
// TYPES AND OTHERS
// --------------------------------

#[repr(C)]
pub struct ResultWithMessage {
    success: bool,
    message: *const c_char,
}

impl ResultWithMessage {
    fn new(success: bool, message: &str) -> Self {
        let c_message = CString::new(message).unwrap();
        ResultWithMessage {
            success,
            message: c_message.into_raw(),
        }
    }
}

// --------------------------------
// POLYSEED
// --------------------------------

#[no_mangle]
extern "C" fn generate_polyseed_mnemonic() -> *mut c_char {
    let seed = polyseed::Polyseed::new(&mut OsRng, polyseed::Language::English);
    let c_string = CString::new(seed.to_string().to_string()).unwrap();
    c_string.into_raw()
}

#[no_mangle]
extern "C" fn is_valid_polyseed_mnemonic(mnemonic: *const c_char, language_code: *const c_char) -> ResultWithMessage {
    let c_str = unsafe {
        assert!(!language_code.is_null());
        CStr::from_ptr(language_code)
    };
    let language_str = c_str.to_str().unwrap_or("");
    let language = match language_str {
        "en" => polyseed::Language::English,
        "es" => polyseed::Language::Spanish,
        "fr" => polyseed::Language::French,
        "it" => polyseed::Language::Italian,
        "ja" => polyseed::Language::Japanese,
        "ko" => polyseed::Language::Korean,
        "cs" => polyseed::Language::Czech,
        "pt" => polyseed::Language::Portuguese,
        "zh-CN" => polyseed::Language::ChineseSimplified,
        "zh-TW" => polyseed::Language::ChineseTraditional,
        _ => polyseed::Language::English,
    };
    let mnemonic_str = unsafe {
        assert!(!mnemonic.is_null());
        CStr::from_ptr(mnemonic)
    }
    .to_str()
    .unwrap_or("");
    let seed = polyseed::Polyseed::from_string(language, zeroize::Zeroizing::new(mnemonic_str.to_string()));
    let message = if seed.is_ok() {
        ""
    } else {
        match seed.clone().err().unwrap() {
            // TODO: Make this error messages local.
            polyseed::PolyseedError::InvalidSeed => "Invalid seed. Please check your mnemonic.",
            polyseed::PolyseedError::InvalidEntropy => "Invalid entropy. Please check your mnemonic.",
            polyseed::PolyseedError::InvalidChecksum => "Invalid checksum. Please check your mnemonic.",
            polyseed::PolyseedError::UnsupportedFeatures => "Unsupported features. Please check your mnemonic.",
        }
    };
    ResultWithMessage::new(seed.is_ok(), message)
}

// --------------------------------
// LEGACY
// --------------------------------

#[no_mangle]
extern "C" fn generate_legacy_mnemonic() -> *mut c_char {
    let seed = monero_seed::Seed::new(&mut rand::rngs::OsRng, monero_seed::Language::English);
    let c_string = CString::new(seed.to_string().to_string()).unwrap();
    c_string.into_raw()
}

#[no_mangle]
extern "C" fn is_valid_legacy_mnemonic(mnemonic: *const c_char, language_code: *const c_char) -> ResultWithMessage {
    let c_str = unsafe {
        assert!(!language_code.is_null());
        CStr::from_ptr(language_code)
    };
    let language_str = c_str.to_str().unwrap_or("");
    let language = match language_str {
        "zh" => monero_seed::Language::Chinese,
        "en" => monero_seed::Language::English,
        "nl" => monero_seed::Language::Dutch,
        "fr" => monero_seed::Language::French,
        "es" => monero_seed::Language::Spanish,
        "de" => monero_seed::Language::German,
        "it" => monero_seed::Language::Italian,
        "pt" => monero_seed::Language::Portuguese,
        "jp" => monero_seed::Language::Japanese,
        "ru" => monero_seed::Language::Russian,
        "eo" => monero_seed::Language::Esperanto,
        "lj" => monero_seed::Language::Lojban,
        "en_deprecated" => monero_seed::Language::DeprecatedEnglish,
        _ => monero_seed::Language::English,
    };
    let mnemonic_str = unsafe {
        assert!(!mnemonic.is_null());
        CStr::from_ptr(mnemonic)
    }
    .to_str()
    .unwrap_or("");
    let seed = monero_seed::Seed::from_string(language, zeroize::Zeroizing::new(mnemonic_str.to_string()));
    let message = if seed.is_ok() {
        ""
    } else {
        match seed.clone().err().unwrap() {
            monero_seed::SeedError::InvalidSeed => "Invalid seed. Please check your mnemonic.",
            monero_seed::SeedError::InvalidChecksum => "Invalid checksum. Please check your 25th word.",
            monero_seed::SeedError::DeprecatedEnglishWithChecksum => "Deprecated English language option included a checksum. Please check your mnemonic.",
        }
    };
    ResultWithMessage::new(seed.is_ok(), message) 
}

// --------------------------------
// FREE
// --------------------------------

#[no_mangle]
extern "C" fn free_c_string(s: *mut c_char) {
    if !s.is_null() {
        unsafe {
            let _ = CString::from_raw(s);
        }
    }
}