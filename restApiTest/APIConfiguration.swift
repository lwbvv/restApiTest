//
//  APIConfig.swift
//  restApiTest
//
//  Created by Developer Appg on 2020/06/09.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation
import Alamofire


protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
