//
// ApiCalls.swift
//  
//
//  Created by LEARN Academy on 6/15/23.
//

import Foundation



//Base URL
public let url = "https://blinkup-dev.herokuapp.com"

let baseURL = URL(string: url + "/api")!

let sessionCreate = baseURL.appendingPathComponent("/sessions/create")

let sessionValidate = baseURL.appendingPathComponent("/sessions/verify")
