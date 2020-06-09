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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func httpCall(_ sender: Any) {

        readNews(language: deviceID.text!)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    func readNews(language: String){

        APIClient.readNews(language: language){
            result in
            switch result{
            case .success(let news):
                for contents in news.news{
                    print(contents.background.url)
                    print(contents.background.type)
                }
            case .failure(let error):
                print("error log")
                print(error.localizedDescription)
            }

        }
    }
    
}


//    func handle(result : Any) {
//        do {
//            let dataJson = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
//
//            self.getInstanceData = try JSONDecoder().decode(BaseModel.self, from: dataJson)
//
//            if let phoneNum = self.getInstanceData?.entity?.userInfo?.userPhone{
//                self.phoneNumber.text = "\(phoneNum)"
//            }
//            if let userNumber = self.getInstanceData?.entity?.userInfo?.userNo {
//                self.resUserNo.text = "\(userNumber)"
//            }
//
//            self.view.layoutIfNeeded()
//
//
//        } catch  {
//            print(error.localizedDescription)
//        }
//    }
