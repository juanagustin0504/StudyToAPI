//
//  ImagePickerViewController.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/19.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imgArr: [UIImage?] = []
    
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        picker.modalPresentationStyle = .fullScreen
        present(picker, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - extension -
extension ImagePickerViewController: UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == imgArr.count {
            self.openLibrary()
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageViewController") as! ShowImageViewController
            vc.modalPresentationStyle = .fullScreen

            guard imgArr[indexPath.row] != nil else {
                return
            }
            
            vc.previewImg = imgArr[indexPath.row]
            self.present(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imgArr.append(image)
            dismiss(animated: true) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension ImagePickerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePickerCell", for: indexPath) as? ImagePickerCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == imgArr.count {
            cell.pickedImageView.image = UIImage(named: "bigCameraIcon.png")
        } else {
            cell.pickedImageView.image = imgArr[indexPath.row]
        }
        
        return cell
    }
    
    
}
