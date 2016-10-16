//
//  NavigationViewController.swift
//  SwagFlix
//
//  Created by Manouana on 07/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController,UIViewControllerTransitioningDelegate{


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barStyle = UIBarStyle.blackOpaque
        self.navigationBar.tintColor = UIColor.blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bar = self.navigationController?.navigationBar
        bar?.barStyle = UIBarStyle.blackOpaque
        bar?.tintColor = UIColor.white
        bar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        
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
