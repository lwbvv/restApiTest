//
//  ViewController.swift
//  restApiTest
//
//  Created by Developer Appg on 2020/06/04.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit
import Network
import Alamofire

struct CheckDevice : Codable {
    var code: String
    var message : String
    var entity : String
}






class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var resUserNo: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var deviceID: UITextField! {
        didSet {
            deviceID.delegate = self
        }
    }
    @IBOutlet weak var userNo: UITextField!{
        didSet {
            userNo.delegate = self
        }
    }
    
    let network = NetworkConnection.init()
    private var handler: ((Any) -> Void)?
    var userData : BaseModel?
    var getInstanceData : BaseModel?
    
    
    func handle(result : Any) {
        do {
            let dataJson = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
            
            self.getInstanceData = try JSONDecoder().decode(BaseModel.self, from: dataJson)
            
            if let phoneNum = self.getInstanceData?.entity?.userInfo?.userPhone{
                self.phoneNumber.text = "\(phoneNum)"
            }
            if let userNumber = self.getInstanceData?.entity?.userInfo?.userNo {
                self.resUserNo.text = "\(userNumber)"
            }
            
            self.view.layoutIfNeeded()
            
            
            //                 network.get(deviceID: deviceID.text ?? "", userNo: userNo.text ?? "", completionHandler: handler!)
            
            
            
            
            
            print("result: \(result)")
            //                print("dataJson.debugDescription:\(dataJson.debugDescription)")
            //                print("dataJson.description:\(dataJson.description)")
            //                print("getInstanceDat.code:\(self.getInstanceData?.code ?? 0)")
            //                print("getInstanceDat.entity:\(self.getInstanceData?.entity?.userInfo?.userNo)")
            
            
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        handler = { result in
//            do {
//                let dataJson = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
//
//                self.getInstanceData = try JSONDecoder().decode(BaseModel.self, from: dataJson)
//
//                if let phoneNum = self.getInstanceData?.entity?.userInfo?.userPhone{
//                    self.phoneNumber.text = "\(phoneNum)"
//                }
//                if let userNumber = self.getInstanceData?.entity?.userInfo?.userNo {
//                    self.resUserNo.text = "\(userNumber)"
//                }
//
//                self.view.layoutIfNeeded()
                
//                print("result: \(result)")
                //                print("dataJson.debugDescription:\(dataJson.debugDescription)")
                //                print("dataJson.description:\(dataJson.description)")
                //                print("getInstanceDat.code:\(self.getInstanceData?.code ?? 0)")
                //                print("getInstanceDat.entity:\(self.getInstanceData?.entity?.userInfo?.userNo)")
                
                
//            } catch  {
//                print(error.localizedDescription)
//            }
//        }
    }
    
    @IBAction func httpCall(_ sender: Any) {
        
//        network.get(deviceID: deviceID.text ?? "", userNo: userNo.text ?? "", completionHandler: handle)
        let get_news = ApiRouter.getNews(language: Api.news)
        let get_n = ApiRouter<Api>.getNews
        let url : URLRequest?
        do {
            url = try get_news.asURLRequest()
            AF.request(url?.url as! URLRequestConvertible).responseJSON{
                response in
                
            }
                  
        } catch  {
            
        }
       
            
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    
}








