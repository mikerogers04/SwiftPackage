//
//  KeychainRetrieve.swift
//  blinkup-sdk
//
//  Created by LEARN Academy on 5/19/23.
//

import Security
import Foundation

//Unique Identifiers for a single keychain
let service = "blinkupSDK"
let account = "sdk123"

public func retrieve() -> String? {
    //Create dictionary
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]
    //Create result variable
    var result: AnyObject?
    //Status code returned if item matched
    let status = SecItemCopyMatching(query as CFDictionary, &result)
    //Status code to check if success or fail, returns token
    if status == errSecSuccess, let retrievedData = result as? Data, let token = String(data: retrievedData, encoding: .utf8) {
        return token
    } else {
        print("Error retrieving code token: \(status.description)")
        return nil
    }
}
