//
//
//import Foundation
//import Alamofire
//
//class NetworkConnection {
//
//
//    let BASE_URL = "http://1.234.83.56:8065"
//
//    func get(params: [String: Any],
//             completionHandler: @escaping(Any) -> Void )
//    {
//
////        params["deviceID"] = deviceID
////        params["userNo"] = userNo
//
//        AF.request("\(Url.BASE.rawValue)\(Url.GET_introProcess.rawValue)", method: .get,
//                   parameters: params).responseJSON {
//                    response in
//
//                    switch response.result {
//                    case .success(let obj):
//                        //인터페이스로 따지면 인터페이스의 구현부
//                        completionHandler(obj)
//
//                    case .failure(let e):
//                        print(e.localizedDescription)
//                        completionHandler(e)
//                    }
//
//        }
//
//    }
//}
//
//
