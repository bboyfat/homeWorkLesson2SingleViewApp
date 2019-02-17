//
//  ViewController.swift
//  HomeWorkLesson2
//
//  Created by Andrey Petrovskiy on 03.02.2019.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Math {
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    func alertMath(sender: UIViewController, label: UILabel) {
        Action().alertMath(sender: self, label: self.answerLabel)
    }
    
    func alertReverse(sender: UIViewController, label: UILabel) {
        Action().alertReverse(sender: self, label: self.answerLabel)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SQRTButton(_ sender: UIButton) {
        alertMath(sender: self, label: self.answerLabel)
    }
    

    @IBAction func reverseButton(_ sender: UIButton) {
        alertReverse(sender: self, label: self.answerLabel)
    }
    
}

