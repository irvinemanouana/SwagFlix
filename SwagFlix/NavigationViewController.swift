//
//  NavigationViewController.swift
//  SwagFlix
//
//  Created by Manouana on 07/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

       var newShow: UIBarButtonItem = UIBarButtonItem(title: "test", style: UIBarButtonItemStyle.plain, target: self, action:nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = newShow
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
