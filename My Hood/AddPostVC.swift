//
//  AddPostVC.swift
//  My Hood
//
//  Created by Gergely Mor Bacskai on 19/06/16.
//  Copyright © 2016 bacskai. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var imgPicker: UIImagePickerController!
    var imagePlace: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImg.layer.cornerRadius = postImg.frame.size.width/2
        postImg.clipsToBounds = true
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        titleField.delegate = self
        descField.delegate = self
        
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        imagePlace = sender
        imgPicker.sourceType = .SavedPhotosAlbum
        presentViewController(imgPicker, animated: true, completion: nil)
    }

    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let img = postImg.image, let title = titleField.text, let desc = descField.text {
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            let post  = Post(imgPath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true;
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        imagePlace.setTitle("+ Add Pic", forState: .Normal)
    }
}
