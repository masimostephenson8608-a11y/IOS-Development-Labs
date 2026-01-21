//
//  ViewController.swift
//  UIKitLab
//
//  Created by Masimo Stephenson on 1/20/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressedButton(_ sender: Any) {
        topLabel.text = "This app rocks!"
    }
    
}

