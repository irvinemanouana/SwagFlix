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
    var imageToLoad = ""
    @IBOutlet weak var day: UILabel!
    var daytxt = ""
    @IBOutlet weak var frequence: UILabel!
    var frequencetxt = ""
    @IBOutlet weak var hourShow: UILabel!
    var hourtxt = ""
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var show: TvShowClass? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = showTitle
        titleLabel.text = showTitle
        descriptionLabel.text = descriptionShow
        hourShow.text = "Notification : "+hourtxt
        day.text = "Jour : "+daytxt
        frequence.text = frequencetxt
        showImage.loadImageFromUrl(imageToLoad)
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
