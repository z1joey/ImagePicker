//
//  ViewController.swift
//  ImagePicker
//
//  Created by Yi Zhang on 2019/8/1.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

import UIKit
import ImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ImagePicker.shared.delegate = self
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        ImagePicker.shared.presented(in: self)
    }

}

extension ViewController: ImagePickerDelegate {
    func imagePicker(didSelect image: UIImage) {
        self.imageView.image = image
    }
}

