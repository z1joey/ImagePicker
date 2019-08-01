//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by Yi Zhang on 2019/8/1.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

import UIKit

// MARK:- Protocol
public protocol ImagePickerDelegate: class {
    func imagePicker(didSelect image: UIImage)
}

// MARK:- API
public extension ImagePicker {
    func presented(in viewController: UIViewController) {
        viewController.present(photoPickerViewController, animated: true, completion: nil)
    }
}

// MARK:- Class
public class ImagePicker: UIViewController {
    
    weak public var delegate: ImagePickerDelegate?
    
    static public let shared = ImagePicker()
    
    fileprivate init() {
        super.init(nibName: nil, bundle: nil)
        print("\n⇥ Init: \(self.classForCoder.description())\n")
    }
    
    deinit {
        print("\n⌧ Deinit: \(self.classForCoder.description())\n")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    fileprivate var photoPickerViewController: UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        return imagePickerController
    }
    
    @available(*, unavailable)
    override open func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        fatalError("Present is banned")
    }

}

// MARK:- delegate
extension ImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("\n⌦ Failed to load image from photo library\n")
        }
        delegate?.imagePicker(didSelect: image)
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
