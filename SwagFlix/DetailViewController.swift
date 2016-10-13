//
//  DetailViewController.swift
//  SwagFlix
//
//  Created by Manouana on 14/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var ShowName : String!
    var Description: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print(ShowName)
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
