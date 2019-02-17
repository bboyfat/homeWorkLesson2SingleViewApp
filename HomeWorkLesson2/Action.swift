//
//  Action.swift
//  HomeWorkLesson2
//
//  Created by Andrey Petrovskiy on 03.02.2019.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import UIKit

protocol Math{
    func alertMath(sender: UIViewController, label: UILabel)
    func alertReverse(sender: UIViewController, label: UILabel)
}

class Action: Math{
    
    var model = Model.singleModel
    
    func alertMath(sender: UIViewController, label: UILabel){
        let alertController = UIAlertController(title: "Enter the variebles", message: nil, preferredStyle: .alert)
        let alertActionSqrt = UIAlertAction(title: "SQRT", style: .default) { (action) in
            guard let a = Double(alertController.textFields?[0].text ?? "0"),
                let b = Double(alertController.textFields?[1].text ?? "0"),
            let c = Double(alertController.textFields?[2].text ?? "0") else {return}
            var x1 = 0.0
            var x2 = 0.0
            var d = 0.0
            d = b * b - 4 * a * c
            if d > 0{
                var f = (sqrt(d))
                x1 = (-b - f) / (2 * a)
                x2 = (-b + f) / (2 * a)
                self.model.sqrt = "D > 0, so x1 = \(x1), and x2 = \(x2)"
                label.text = self.model.sqrt
                print("D > 0, so x1 = \(x1), and x2 = \(x2)")
            } else if d == 0 {
                x1 = -(b / (2 * a))
                x2 = x1
                self.model.sqrt = "D = 0, and x = \(x1)"
                label.text = self.model.sqrt
                print("D = 0, and x = \(x1)")
            } else {
                x1 = 0
                x2 = x1
                self.model.sqrt = "D < 0"
                label.text = self.model.sqrt
                print(" D <0")
            }
            print (x1,x2)
            
        }
        let alertActionVector = UIAlertAction(title: "Vector!", style: .cancel) { (action) in
            
            guard let x = Double(alertController.textFields?[0].text ?? "0"),
                let y = Double(alertController.textFields?[1].text ?? "0"),
                let z = Double(alertController.textFields?[2].text ?? "0") else {return}
            let b = (x * x) + (y * y) + (z * z)//находим сумму квадратов координат
            
            let a = sqrt(b) // извлекаем квадратный корень и получаем длину вектора
            
            self.model.vectorAnswer  = "Length of your Vector = \(a) "
            label.text = self.model.vectorAnswer
            print(a)
            
        }
        
        alertController.addTextField { (text) in
            text.placeholder = "enter a or x"
            text.keyboardType = .numberPad
            
        }
        alertController.addTextField { (text) in
            text.placeholder = "enter b or y"
            text.keyboardType = .numberPad
        }
        alertController.addTextField { (text) in
            text.placeholder = "enter c or z"
            text.keyboardType = .numberPad
        }
        alertController.addAction(alertActionSqrt)
        alertController.addAction(alertActionVector)
        sender.present(alertController, animated: true, completion: nil)
    }
    func alertReverse(sender: UIViewController, label: UILabel){
        let alertController = UIAlertController(title: "Enter your Number", message: nil, preferredStyle: .alert)
        
        let alerAction = UIAlertAction(title: "Reverse!", style: .destructive) { (action) in
            guard let num = alertController.textFields?[0].text else {return}
            let str = String(num.reversed())
            self.model.reverseAnswer = " Your number = \(str)"
            label.text = self.model.reverseAnswer
            print(str)
        }
        
        alertController.addTextField { (text) in
            text.placeholder = "enter the number"
            text.keyboardType = .numberPad
            
        }
        alertController.addAction(alerAction)
        sender.present(alertController, animated: true, completion: nil)
    }
}
