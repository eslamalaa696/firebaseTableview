//
//  ViewController.swift
//  Appp
//
//  Created by mac on 2/22/21.
//

import UIKit
import Firebase


class packageVc: UIViewController {
    var rooms = [Room]()
    
    @IBOutlet weak var usernameTxtPacage: UITextField!
    
    @IBOutlet weak var adressTxvPackage: UITextView!
    
    @IBOutlet weak var ageTxfPackage: UITextField!
    
    @IBOutlet weak var  addButtonPAckage: UIButton!
    
    var reference: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonPAckage.setTitle("Add", for: .normal)
        addButtonPAckage.layer.cornerRadius = 15
        addButtonPAckage.layer.masksToBounds = true
        adressTxvPackage.layer.cornerRadius = 20
    
    }
   
    @IBAction func Add(_ sender: Any) {
        guard let username = usernameTxtPacage.text ,!username.isEmpty
        else {
        showAlert(message: "please enter username")
            return
        }
        guard let adress = adressTxvPackage.text , !adress.isEmpty
        else {
            showAlert(message: "please enter adress")
            return
        }
        guard let age = ageTxfPackage.text , !age.isEmpty
        else{
        showAlert(message: "please enter age")
            return

        }
        reference = Database.database().reference()
        reference.child("users").childByAutoId().setValue(["userName":username, "age": age, "address":adress])
        let story = UIStoryboard(name: "Main", bundle: nil)
        let formscreen = story.instantiateViewController(identifier: "packages") as! packagesVc
        self.dismiss(animated: true)
//        self.present(formscreen, animated: true, completion: nil)
    }
    
    func showAlert(message: String){
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
    
    let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: {action in
        
        print("tapped dismiss")
    })
    alert.addAction(cancel)
    present(alert, animated: true, completion: nil)
    }
    
}


