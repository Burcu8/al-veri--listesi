//
//  DetailsViewController.swift
//  AlışverişListesi
//
//  Created by Burcu Kamilçelebi on 5.03.2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var bedenTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //viewda herhangi bir yere tıklandığını algılamak için.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        
    }
    //kütüphanedeki görseller için
    @objc func gorselSec() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true // editlemeye izin veriyoruz.
        present(picker, animated: true, completion: nil)
    }
    
    // medya seçme bitince ne olacak
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        // imagepicker controllerı kapatıyor.
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    @objc func klavyeyiKapat() {
        view.endEditing(true)
    }
    
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        //anahtar kelime için bir değer tanımla
        alisveris.setValue(isimTextField.text, forKey: "isim")
        alisveris.setValue(bedenTextField.text, forKey: "beden")
        
        if let fiyat = Int(fiyatTextField.text!) {
            alisveris.setValue(fiyatTextField.text, forKey: "fiyat")
        }
        // universal unique id
        alisveris.setValue(UUID(), forKey: "id")
        
        //image'ı veriye çeviriyoruz
        let data = imageView.image!.jpegData(compressionQuality: 0.5) // sıkıştırma kalitesi
        
        alisveris.setValue(data, forKey: "gorsel")
        
        do {
            try context.save()
            print("kayıt edildi")
        } catch {
            print("hata var")
        }
        
        
        
        
        
    }
    


}
