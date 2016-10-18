//
//  DetailViewController.swift
//  SwagFlix
//
//  Created by Manouana on 14/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var showImage: UIImageView!
    var showTitle = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var descriptionShow = ""
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var show: TvShowClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = showTitle
        titleLabel.text = showTitle
        descriptionLabel.text = descriptionShow
        showImage.loadImageFromUrl("http://lestoilesheroiques.fr/wp-content/uploads/2015/09/luke-cage-tournage-serie-netflix-marvel-shoot.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bar = self.navigationController?.navigationBar
        bar?.barStyle = UIBarStyle.blackOpaque
        bar?.tintColor = UIColor.red
        bar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
