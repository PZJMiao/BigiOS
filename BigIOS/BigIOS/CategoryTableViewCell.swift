//
//  CategoryTableViewCell.swift
//  BigIOS
//
//  Created by Plucky@分红全球购 on 16/8/4.
//  Copyright © 2016年 echo.engineer. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCategory: UIImageView!
    
    @IBOutlet weak var labelCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
