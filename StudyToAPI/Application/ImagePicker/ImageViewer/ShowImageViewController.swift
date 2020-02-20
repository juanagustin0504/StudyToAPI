//
//  ShowImageViewController.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/19.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.image = previewImg
        }
    }
    var previewImg : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
