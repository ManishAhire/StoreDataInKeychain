//
//  ViewController.swift
//  StoreDataInKeychain
//
//  Created by Manish Ahire on 21/02/21.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var txtPassword: UITextField!
    
    //MARK:- Variables
    enum Keys {
        static let password = "PASSSWORD"
    }
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //MARK:- Button Actions
    @IBAction func actionOnSavePassword(_ sender: Any) {
        guard let password = txtPassword.text else {
            return
        }
        
        let savePassword = KeychainWrapper.standard.set(password, forKey: Keys.password)
        
        if savePassword {
            print("Password saved successfully")
        }
        self.view.endEditing(true)
    }
    
    @IBAction func actionOnRetrievePassword(_ sender: Any) {
        
        guard let password = KeychainWrapper.standard.string(forKey: Keys.password) else {
            return
        }
        print("Password is: \(password)")
    }
    
    @IBAction func actionOnRemovePassword(_ sender: Any) {
        let removePassword = KeychainWrapper.standard.removeObject(forKey: Keys.password)
        
        if removePassword {
            print("Password removed successfully")
        }
        
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

