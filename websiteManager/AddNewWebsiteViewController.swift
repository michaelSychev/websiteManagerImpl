//
//  AddNewWebsiteViewController.swift
//  websiteManager
//
//  Created by Michael Sychev on 10/22/22.
//

import UIKit
import CoreData
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let coreDataContext = appDelegate.persistentContainer.viewContext
class AddNewWebsiteViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var m_url: UITextField!
    @IBOutlet weak var m_userName: UITextField!
    @IBOutlet weak var m_password: UITextField!
    @IBOutlet weak var m_cellName: UITextField!
    //func that adds new account into core data
    //pre:all inpputs must not be empty string("")
    func addNewAccount(username: String, password: String , url: String, cellName: String) -> Void
    {
        let newWebsite: WebsiteInformation = WebsiteInformation(context: coreDataContext)//creates new instance of Accounts object
        newWebsite.username = username
        newWebsite.password = password
        newWebsite.url = url
        newWebsite.mycellname = cellName
        appDelegate.saveContext()
        
    }
    
    @IBAction func buttonSubmit(_ sender: Any)
    {
        //check if parameters are empty
        if(m_url.text! == "" || m_password.text! == "" || m_userName.text! == "" || m_cellName.text! == "")//if empty toast user with failure
        {
            let alertController = UIAlertController(title: "Invalid input",
                                                    message:"All fields must be filled out 🤯",
                                                    preferredStyle:UIAlertController.Style.alert);
                   
                   alertController.addAction(UIAlertAction(title: "I will flll all values",
                                                           style:UIAlertAction.Style.default,
                                                           handler:nil));
                   
                   present(alertController,animated:true,completion:nil);
        }
        
        else
        {
            //otherwise we send data to coredata and toast user with success
            //store paramters to core data
            addNewAccount(username: m_userName.text!, password: m_password.text!, url: m_url.text!, cellName: m_cellName.text!)
            let alertController = UIAlertController(title: "Success",
                                                    message:"\(m_cellName.text!) as been added 🫡",
                                                    preferredStyle:UIAlertController.Style.alert);
                   
                alertController.addAction(UIAlertAction(title: "one less website to remember 😎",
                                                        style:UIAlertAction.Style.default,
                                                        handler:nil));
                   
                present(alertController,animated:true,completion:nil);
        }
                      
        
       //clear text fields
        m_url.text = ""
        m_userName.text = ""
        m_password.text = ""
        m_cellName.text = ""
        
        
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
