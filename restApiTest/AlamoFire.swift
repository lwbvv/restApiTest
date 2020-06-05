

import Foundation
import Alamofire

class NetworkConnection {
    
    
    let BASE_URL = "http://1.234.83.56:8065"
    var params = [
                "deviceID" : "asd",
                "deviceTypeID" : "2",
                "registrationKey" : "registrationKey",
                "appVersion" : "1.0.0",
                "userNo" : "1"
            ]
    
    func get(deviceID : String = "asd",
             userNo : String = "1",
             completionHandler: @escaping(Any) -> Void )
    {
       
        params["deviceID"] = deviceID
        params["userNo"] = userNo
        
        AF.request("\(BASE_URL)/api/common/introProcess", method: .get,
                   parameters: params).responseJSON {
                    response in
                    
                    switch response.result {
                    case .success(let obj):
                        //인터페이스로 따지면 인터페이스의 구현부
                        completionHandler(obj)
                
                    case .failure(let e):
                        print(e.localizedDescription)
                        completionHandler(e)
                    }
                    
        }

    }
}


