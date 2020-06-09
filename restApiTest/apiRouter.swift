//
//  NewsEndpoint.swift
//  restApiTest
//
//  Created by Developer Appg on 2020/06/09.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : APIConfiguration{
    
    case readNews(language : String)
    case writeNews(no: Double)
    
    
    //api의 메소드 설정
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .readNews:
            return .get
        default:
            return .get
        }
    }
    
    
    //엔드포인트? 경로
    // MARK: - Path
    var path: String {
        switch self {
        case .readNews:
            return Api.news
        default:
            return ""
        }
    }
    
    //request parameter 유형
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
//        case .readNews(language: let language, let userNo): //인자값을 다시 설정해 주는게 이해가 잘 안감. 스트링 형태로만 들어가나?
//            return [Constants.Parameters.language: language]
//        default:
//            return nil
        case .readNews(language: let language):
            return [Constants.Parameters.language: language]
        default:
            return nil
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        //루트 url
        let url = try Constants.baseUrl.asURL()
        
        //엔드포인트 경로
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        //메소드 설정
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        

        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        //??? parameter 값을 _parameter에 옮겨 담는다?????
        if let parameters = parameters {
             print("parameters = \(parameters)")
        }
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}





//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
  //        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

//        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        
        // Parameters
//        if let parameters = parameters {
//            do {
//                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            } catch {
//                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
//            }
//        }
