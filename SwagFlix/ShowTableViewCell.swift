//
//  ShowTableViewCell.swift
//  SwagFlix
//
//  Created by Manouana on 09/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var imageShow: UIImageView!
    
    @IBOutlet weak var descriptionShow: UILabel!
    @IBOutlet weak var titleShow: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
