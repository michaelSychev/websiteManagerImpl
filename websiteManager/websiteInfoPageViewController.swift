//
//  websiteInfoPageViewController.swift
//  websiteManager
//
//  Created by Michael Sychev on 10/21/22.
//

import UIKit

class websiteInfoPageViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
       // Link("SwiftUI Tutorials", destination: URL(string: "https://www.simpleswiftguide.com")!)
        labelUserName.text = newWebsiteInfo.username
        labelPassword.text = newWebsiteInfo.password
        labelWebsiteName.text = newWebsiteInfo.mycellname
    }
    


    @IBAction func buttonOpenWebsite(_ sender: Any)
    {
        let fileUrl = URL(fileURLWithPath: newWebsiteInfo.url!)
        UIApplication.shared.open(URL(string: newWebsiteInfo.url!)! as URL, options: [:], completionHandler: nil)

    }
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
   

    @IBOutlet weak var labelWebsiteName: UILabel!
    
    
}
