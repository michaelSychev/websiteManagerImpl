//
//  SecureLoginViewController.swift
//  websiteManager
//
//  Created by Michael Sychev on 10/23/22.
//

import UIKit

class SecureLoginViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldpassword: UITextField!
    let password: String = "test"
    let username: String = "test"
    

    @IBAction func buttonLogin(_ sender: Any)
    {
        if((textfieldpassword.text == password) && (textfieldUserName.text == username))
        {
            performSegue(withIdentifier: "secureLogin", sender:  self)
        }
        else
        {
            let alertController = UIAlertController(title: "Invalid username or password😡 ",
                                                            message:"please try again",
                                                            preferredStyle:UIAlertController.Style.alert);
                    
                    alertController.addAction(UIAlertAction(title: "KK",
                                                            style:UIAlertAction.Style.default,
                                                            handler:nil));
                    
                    present(alertController,animated:true,completion:nil);
        }
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
