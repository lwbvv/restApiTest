//
//  APIClient.swift
//  restApiTest
//
//  Created by Developer Appg on 2020/06/09.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    
    func baseRequest(api: APIRouter) -> DataRequest{
        return AF.request(api)
    }
    
    
    
    static func readNews(language : String, completion:@escaping (Result<News, AFError>)->Void) {
        AF.request(APIRouter.readNews(language: language))
            .responseDecodable { (response: DataResponse<News, AFError>) in
                completion(response.result)
        }
    }

    
    


  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    static func showNews(language : String, completion:@escaping(Any) -> Void ){
//        AF.request(APIRouter.readNews(language: language))
//            .responseJSON{
//                response in
//                
//                switch response.result{
//                case .success(let news):
//                    print("news =")
//                    completion(news)
//                case .failure(let error):
//                    print("error log")
//                    print(error.localizedDescription)
//                }
//        }
//    }
    
}
