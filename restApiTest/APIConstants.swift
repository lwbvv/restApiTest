//
//  ApiConstants.swift
//  doThat
//
//  Created by Developer Appg on 2020/03/05.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation


struct Api {
    
    // MARK: - Common
    static let news = "/v1/app/news"
    
    // "https://api.cgagu.co.kr/v1/app/news"
    
}

struct Constants {
    
    // Release
    static let baseUrl = "https://api.cgagu.co.kr"
    
    struct Parameters {
        
        static let language = "language"

    }
    
    enum language : String{
        case en = "en"
        case kr = "kr"
        case cn = "cn"
    }
    
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
        case multipart = "multipart/form-data"
    }
}
