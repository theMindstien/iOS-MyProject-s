//
//  ViewController.swift
//  CameraGalleryMobApp
//
//  Created by apple on 06/10/22.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    
    @IBOutlet weak var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadSavedPicture()
    }

    @IBAction func actionCamera(_ sender: Any) {
        let alert = UIAlertController(title: "You want to Click Camera", message: "", preferredStyle: UIAlertController.Style.alert)
        
        
        var yesAction:UIAlertAction = UIAlertAction(title: "YES", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yesAction)
        
        var closeAction:UIAlertAction = UIAlertAction(title: "CLOSE", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addAction(closeAction)
        present(alert, animated: true)
        
        
        
    }
    
    @IBAction func actionGallery(_ sender: Any) {
        let imageController = UIImagePickerController()
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        imageController.isEditing = true
        imageController.delegate = self
        self.present(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage:UIImage = info[UIImagePickerController.InfoKey.originalImage]as!UIImage
        
        imageView?.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
        saveSelectedImage(img: selectedImage)
    }
    
    func saveSelectedImage(img:UIImage)->Void
    {
        let pathArray:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let imagePath = pathArray[0]+"/mypic.png"
        
        let imageData:Data = img.pngData()!
        
        let fm:FileManager = FileManager.default
        fm.createFile(atPath: imagePath, contents: imageData, attributes: nil)
    }
    
    func loadSavedPicture()->Void
    {
        let pathArray:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let imagePath = pathArray[0]+"/mypic.png"
        let fm:FileManager = FileManager.default
        let imageData = fm.contents(atPath: imagePath)
        if (imageData != nil){
            let loadedImage = UIImage(data: imageData!)
            imageView?.image = loadedImage}
    }
}

