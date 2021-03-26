//
//  ViewController.swift
//  FirebaseSendMessage
//
//  Created by Jorge Pinedo on 7/6/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var input: UITextField!
    var ref: DatabaseReference!

    override func viewDidLoad() {
        let ref = Database.database().reference()

        super.viewDidLoad()
        ref.child("message").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? String
//            let username = value?["username"] as? String ?? ""
//            let user = User(username: username)
            print(value)
            self.label.text = value
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    @IBAction func send(_ sender: Any) {
        
        let ref = Database.database().reference()
        ref.child("message").setValue(input.text)
        
    }
    
}

