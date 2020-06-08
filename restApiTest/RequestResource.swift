//
//  RequestResource.swift
//  restApiTest
//
//  Created by Developer Appg on 2020/06/08.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation

enum Url : String{
    case BASE = "http://1.234.83.56:8065"
    case GET_introProcess = "/api/common/introProcess"
}


class RequestApi {
    
    func callApi() {

        var params: [String: Any] = [
            "deviceID" : "asd",
            "deviceTypeID" : "2",
            "registrationKey" : "registrationKey",
            "appVersion" : "1.0.0",
            "userNo" : "1"
        ]
        
    }
}
