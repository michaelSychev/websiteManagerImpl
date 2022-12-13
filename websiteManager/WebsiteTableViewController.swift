//
//  WebsiteTableViewController.swift
//  websiteManager
//
//  Created by Michael Sychev on 10/19/22.
//

import UIKit
import CoreData
var newWebsiteInfo : WebsiteInformation = WebsiteInformation()
class WebsiteTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    let tableviewPatientTable: UITableView = UITableView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

            view.addSubview(tableviewPatientTable)
            tableviewPatientTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableviewPatientTable.delegate = self
            tableviewPatientTable.dataSource = self
//            tableviewPatientTable.reloadData()
//        tableviewPatientTable.backgroundView = UIImageView(image: UIImage(named: "iPhone-13-Pro-matching-gradient-wallpaper-AR72014-iDownloadBlog-Sierra-Blue-768x1662"))
//
//        tableviewPatientTable.backgroundColor = UIColor.clear
//        self.tableviewWebsiteview.backgroundColor = UIColor.lightGray

        


    }
    
    var websiteCollection: [WebsiteInformation] = []
    var websiteNames: [String] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //print(websiteNames.count)
        return websiteCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = websiteCollection[indexPath.row].mycellname

        cell.layer.backgroundColor = UIColor.clear.cgColor

      //  cell.contentView.backgroundColor = .clear
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated:true)
        //perform segueway to new viewcontroller wth necesary infp
        newWebsiteInfo = websiteCollection[indexPath.row]
        performSegue(withIdentifier: "nothingimportant", sender: newWebsiteInfo)
        
    }
   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "nothingimportant"
//        {
//            let myWebsiteInfoPageViewController = segue.destination as? websiteInfoPageViewController
//            myWebsiteInfoPageViewController?.labelURL.text! = newWebsiteInfo.url!
//            myWebsiteInfoPageViewController?.labelPassword.text = newWebsiteInfo.password
//            myWebsiteInfoPageViewController?.labelUserName.text = newWebsiteInfo.username
//            myWebsiteInfoPageViewController?.labelWebsiteName.text = newWebsiteInfo.mycellname
//        }
//        if segue.identifier == "name”OfSegue {
//                let VC = segue.destination as! NameofViewControllerDestination
//                    VC.nameOfWhatYouAreSending   = sender as! TypeOfTheObjectSent
//                }
        
//    }
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        //view.frame = CGRect(x: 300, y: 300, width: 1000, height: 2000)

        tableviewPatientTable.frame = view.frame
        tableviewPatientTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        do
        {
            websiteCollection =  try coreDataContext.fetch(WebsiteInformation.fetchRequest())
            
        }
        catch{
            print("could not fetch core data :(")
        }
        
        for website in websiteCollection
        {
            if let safeWebsiteName = website.mycellname
            {
                websiteNames.append(safeWebsiteName)
            }
        }
        tableviewPatientTable.reloadData()
    
    }

    
//PUT DELETE FUNCTION
    //Swipe left to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
         
        if editingStyle == .delete
        {
                let website = websiteCollection[indexPath.row]
                coreDataContext.delete(website)
                websiteCollection.remove(at: indexPath.row)
                tableviewPatientTable.deleteRows(at: [indexPath], with: .fade)
                appDelegate.saveContext()
            }

        }
    
   

}
