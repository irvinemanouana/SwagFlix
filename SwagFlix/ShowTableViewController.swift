//
//  ShowTableViewController.swift
//  SwagFlix
//
//  Created by Manouana on 05/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {
    
    var shows : [String] = ["Luke Cage","Dardevil","Orange is the new Black","Narcos","Sens8","Strange Things","Sherlock","Jessica Jones", "Iron Fist"]
    
    var indentifier : String = "reuseIdentifier"
    var newShow: UIBarButtonItem = UIBarButtonItem(title: "Ajouter", style: UIBarButtonItemStyle.plain, target: self, action:#selector(ShowTableViewController.goToAddShow(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataHelper = TvShowDataHelper.sharedInstance
        let tvShows :[TvShowClass] = dataHelper.getAllTvShows()
        for show in tvShows{
            shows.append(String(describing: show.title))
        }
        navigationItem.rightBarButtonItem = newShow
    
        
        let logo = UIImage(named: "icon-bar.png")
        let imageview = UIImageView(image: logo)
        self.navigationItem.titleView = imageview
        //title = "SWAGFLIX"
        print("Shows"+String(shows.count))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        tableView.delegate = self
        tableView.dataSource = self
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToAddShow(_ sender: AnyObject) {
        print("GO")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.shows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let withIdentifier = "reuseIdentifier"
        //let cell = tableView.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath)
          let cell = tableView.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath) as! ShowTableViewCell
        

        // Configure the cell...
        cell.titleShow.text = shows[indexPath.row]
        //cell.titleShow.adjustsFontSizeToFitWidth = true
        cell.descriptionShow.text = shows[indexPath.row]

        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(shows[indexPath.item])
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detail, animated: true)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            (segue.destination as! DetailViewController).ShowName = "Luke"
        }
    
    }
    
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
