//
//  ShowTableViewController.swift
//  SwagFlix
//
//  Created by Manouana on 05/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {
    
    
    
    var indentifier : String = "reuseIdentifier"
    var showsList :[TvShow]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataHelper = TvShowDataHelper.sharedInstance
        
        showsList = dataHelper.getAllTvShows()
       
        
        let logo = UIImage(named: "swagflixbar.png")
        let imageview = UIImageView(image: logo)
        self.navigationItem.titleView = imageview
    
        tableView.delegate = self
        tableView.dataSource = self
     
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        tableView.delegate = self
        tableView.dataSource = self
        
        //let btnTest = UIBarButtonItem(title: "Ok", style: UIBarButtonItemStyle.done, target: self, action: #selector(ShowTableViewController.pushToView))
        //navigationItem.leftBarButtonItem = btnTest
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bar = self.navigationController?.navigationBar
        bar?.barStyle = UIBarStyle.blackOpaque
        bar?.tintColor = UIColor.red
        bar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
    }
    
    /*
    func pushToView(){
        print("Button tapped")
                
        let myView : AddShowViewController = AddShowViewController()
        self.navigationController?.pushViewController(myView, animated: true)
    }
    */
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.showsList!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let withIdentifier = "reuseIdentifier"
        //let cell = tableView.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath)
          let cell = tableView.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath) as! ShowTableViewCell

        // Configure the cell...
        cell.titleShow.text = showsList?[indexPath.row].title_show
        //cell.titleShow.adjustsFontSizeToFitWidth = true
        cell.descriptionShow.text = showsList?[indexPath.row].description_show
        cell.imageShow.loadImageFromUrl((showsList?[indexPath.row].picture_show)!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //Passing Data Between Controllers 
        detail.showTitle = (showsList?[indexPath.item].title_show)!
        detail.descriptionShow = (showsList?[indexPath.item].description_show)!
        detail.hourtxt = (showsList?[indexPath.item].hour_alert_show)!
        detail.daytxt = (showsList?[indexPath.item].day_out_show)!
        detail.imageToLoad = (showsList?[indexPath.item].picture_show)!
        detail.frequencetxt = (showsList?[indexPath.item].frequency_out_show)!


        self.navigationController?.pushViewController(detail, animated: true)
    }
    
   
    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            let dataHelper = TvShowDataHelper.sharedInstance
            dataHelper.deleteTvShow(myTvShow: (showsList?[indexPath.item])!)
            
            print("tu supprimes ici Nour")
        }
    }
   
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Supprimer"
    }
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
