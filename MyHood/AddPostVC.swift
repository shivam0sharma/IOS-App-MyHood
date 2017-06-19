//
//  AddPostVC.swift
//  MyHood
//
//  Created by Shivam Sharma on 6/16/17.
//  Copyright © 2017 ShivamSharma. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var postImage: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPostVC.dismissKeyboard))
        view.addGestureRecognizer(tap)

        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func makePostButtonPressed(_ sender: UIButton) {
        if let title = titleField.text, let desc = descriptionField.text, let image = postImage.image {
            let imagePath = DataService.instance.saveImageAndCreatePath(image: image)
            
            let post = Post(imagePath: imagePath, title: title, postDescription: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func addPicButtonPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            postImage.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
