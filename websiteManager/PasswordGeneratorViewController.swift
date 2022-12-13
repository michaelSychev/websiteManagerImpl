//
//  PasswordGeneratorViewController.swift
//  websiteManager
//
//  Created by Michael Sychev on 10/23/22.
//

import UIKit

class PasswordGeneratorViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textfieldPasswordValue: UITextField!
    
    @IBAction func buttonNewPassword(_ sender: Any)
    {
        var genereatedPassword = randomString(len: 12)
        textfieldPasswordValue.text = genereatedPassword
    }
    func randomString(len:Int) -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()" //create character set
        var characters = Array(charSet)
        var password:String = "" //create password tp return
        for passwordChars in (1...len) {
            password.append(characters[Int(arc4random()) % characters.count])
        }
        
        return password
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
