//
//  ImagePickerCell.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/19.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ImagePickerCell: UITableViewCell {
    
    @IBOutlet weak var pickedImageView: UIImageView!
//    @IBOutlet weak var delImgButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
