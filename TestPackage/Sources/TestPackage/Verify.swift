//
//  Verify.swift
//  
//
//  Created by LEARN Academy on 6/15/23.
//

import Foundation

func sendSmsVerification(mobileNumber: String) {
    //Set url to API endpoint
    let url = sessionCreate
    
    //Create model for phone number
    struct Response: Codable {
        let mobileNumber: String
    }
    //Convert data into json
    guard let jsonData = try? JSONEncoder().encode(["mobileNumber": mobileNumber]) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    // Create the url request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
    request.httpBody = jsonData
    //create a URL session
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        //data is the mobile number user enters
        guard let data = data else {
            print("Error: Did not receive data")
            return
        }
        //set reponse to range of status codes
        //MARK: clean up status code range if possible
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: SMS HTTP request failed")
            return
        }
        
        do {
            guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                print("Error: Cannot convert data to JSON object")
                return
            }
            print(jsonObject)
            //extract token from object
            guard let token = jsonObject["token"] as? String else {
                print("Error: Code token not found in response")
                return
            }

            //convert token to a data string
//            let twilioToken = Data(token.utf8)
//            try store(data: twilioToken)
        } catch {
            print("Error: Trying to convert JSON data to string")
            return
        }
    }.resume()
}
