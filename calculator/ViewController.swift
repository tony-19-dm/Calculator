//
//  ViewController.swift
//  calculator
//
//  Created by Антон Дмитриев on 11.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ResaltLabel: UILabel!
    var stillTyping = false
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var sign: String = ""
    var dot = false
    
    var currenttnput: Double {
        get {
            return Double(ResaltLabel.text!)!
        }
        
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                ResaltLabel.text = "\(valueArray[0])"
            }
            else {
                ResaltLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    @IBAction func NemberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            ResaltLabel.text = ResaltLabel.text! + number
        }
        
        else {
            ResaltLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandSignPressed(_ sender: UIButton) {
        sign = sender.currentTitle!
        firstNumber = currenttnput
        stillTyping = false
        dot = false
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double ){
        currenttnput = operation(firstNumber, secondNumber)
        stillTyping = false
    }
    
    
    
    @IBAction func eqalPressed(_ sender: UIButton) {
        if stillTyping {
            secondNumber = currenttnput
        }
        
        dot = false
        
        switch sign {
        case "÷":
            operateWithTwoOperands{$0 / $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "+":
            operateWithTwoOperands{$0 + $1}
        default: break
            
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        currenttnput = 0
        ResaltLabel.text = "0"
        stillTyping = false
        dot = false
        sign = ""
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        currenttnput = -currenttnput
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        if firstNumber == 0 {
            currenttnput = currenttnput / 100
        }
        else {
            secondNumber = firstNumber * currenttnput / 100
        }
    }
    
    
    @IBAction func pointButton(_ sender: UIButton) {
        if stillTyping && !dot {
            ResaltLabel.text = ResaltLabel.text! + "."
            dot = true
        }
        else if !stillTyping && !dot{
            ResaltLabel.text = "0."
        }
    }
    
    @IBAction func sqrtButton(_ sender: UIButton) {
        currenttnput = sqrt(currenttnput)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

