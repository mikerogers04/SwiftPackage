////
//  KeychainStore.swift
//  blinkup-sdk
//
//  Created by LEARN Academy on 5/19/23.
//

import Security
import Foundation

//Unique Identifiers for a single keychain
let globalService = "blinkupSDK"
let globalAccount = "sdk123"

public func store(data: Data) throws {
    //create dictionary
    let query: [CFString: Any] = [
        kSecClass: kSecClassGenericPassword,
        kSecAttrService: globalService,
        kSecAttrAccount: globalAccount
    ]
    //Set atttibutes to be updated
    let updateAttributes = [
        kSecValueData: data
    ] as CFDictionary
    //Update item in keychain if item present, returns status
    let status = SecItemUpdate(query as CFDictionary, updateAttributes)
    //If status success, print success
    if status == errSecSuccess {
        print("Successfully updated token.")
    } else if status == errSecItemNotFound {
            // If item doesn't exist, create query to add item
            let newItem: [CFString : Any] = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: globalService,
                kSecAttrAccount: globalAccount,
                kSecValueData: data
            ]
            //Add item to keychain and return status
            let addStatus = SecItemAdd(newItem as CFDictionary, nil)
            //If add succeeds then print success, else print error
            if addStatus == errSecSuccess {
                print("Successfully stored token.")
            } else {
                print("Error: Failed to store token. \(addStatus)")
            }
        } else {
            print("Error: Failed to update token. \(status)")
        }
}
