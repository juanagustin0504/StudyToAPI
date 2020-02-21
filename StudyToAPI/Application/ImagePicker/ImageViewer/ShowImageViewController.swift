//
//  ShowImageViewController.swift
//  StudyToAPI
//
//  Created by Webcash on 2020/02/19.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    
    // Second try =======================================================================
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.image = previewImg
        }
    }
    var previewImg : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false

        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 2.0
        scrollView.delegate = self

        let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapScrollView))
        doubleTapGest.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGest)

    }

    @objc func handleDoubleTapScrollView(recognizer: UITapGestureRecognizer) {
        if scrollView.zoomScale == 1 {
            scrollView.zoom(to: zoomRectForScale(scale: scrollView.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }

    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width  = imageView.frame.size.width  / scale
        let newCenter = view.convert(center, from: imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // First try ========================================================================
//    @IBOutlet weak var imageView: UIImageView! {
//        didSet {
//            self.imageView.image = previewImg
//        }
//    }
//    var previewImg : UIImage!
//
//    var tapGesture: UITapGestureRecognizer!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(_:)))
//
//        self.view.addGestureRecognizer(pinchRecognizer)
//    }
//
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
//
//    @objc func pinchAction(_ sender: UIPinchGestureRecognizer) {
//        imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
//
//        sender.scale = 1.0
//    }
    
}

//MARK: - extension -
extension ShowImageViewController: UIScrollViewDelegate {
    @available(iOS 2.0, *)
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
