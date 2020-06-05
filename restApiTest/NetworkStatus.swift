////
////  NewworkStatus.swift
////  restApiTest
////
////  Created by Developer Appg on 2020/06/05.
////  Copyright © 2020 appg. All rights reserved.
////
//
//import Foundation
//
//public enum Result<Value> {
//    case success(Value)
//    case failure(Error)
//    
//    public var isSuccess : Bool {
//        switch self {
//        case .success:
//            return true
//        case .failure:
//            return false
//        }
//    }
//    
//    public var isFailure : Bool {
//        return !isSuccess
//    }
//    
//    public var value: Value? {
//        switch self {
//        case .success(let value):
//            return value
//        case .failure:
//            return nil
//        }
//    }
//    
//    public var error: Error? {
//        switch self {
//        case .success(<#T##Value#>):
//            return nil
//        case .failure(let error):
//            return error
//        }
//    }
//    
//}
