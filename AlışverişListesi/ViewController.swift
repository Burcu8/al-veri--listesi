//
//  ViewController.swift
//  AlışverişListesi
//
//  Created by Burcu Kamilçelebi on 5.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButonuTiklandi))
        
    }
    @objc func eklemeButonuTiklandi() {
        
        performSegue(withIdentifier: "toDetailsvc", sender: nil)
    }

}

