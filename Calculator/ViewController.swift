//
//  ViewController.swift
//  Calculator
//
//  Created by James Coyne on 10/3/16.
//  Copyright © 2016 James Coyne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentNumber = ""
    var currentOperator = ""
    var firstNumber: Double?
    var secondNumber: Double?
    @IBOutlet weak var OutputBox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OutputBox.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function for updating the display
    func updateDisplay(updatedRead: String){
        OutputBox.text = updatedRead
        if((OutputBox.text?.characters.count)! < 38){
            OutputBox.font = UIFont(name: OutputBox.font.fontName,
                                    size: CGFloat(50-(OutputBox.text?.characters.count)!))
        }
    }
  
    @IBAction func Buttons(_ sender: AnyObject) {
        currentNumber += sender.currentTitle!!
        updateDisplay(updatedRead: currentNumber)
    }
    
    //functions for delete and clear buttons
    @IBAction func buttClear(_ sender: AnyObject) {
        currentNumber = ""
        updateDisplay(updatedRead: currentNumber)
    }
    @IBAction func deleteButt(_ sender: AnyObject) {
        if(currentNumber.characters.count > 0){
        currentNumber = currentNumber.substring(to:currentNumber.index(before:currentNumber.endIndex))
        updateDisplay(updatedRead: currentNumber)
        }
    }
    
    //functions for "special" characters, decimal point and negative sign
    @IBAction func deciButt(_ sender: AnyObject) {
        if(currentNumber.range(of: ".") == nil){
            currentNumber += "."
            updateDisplay(updatedRead: currentNumber)
        }
    }
    @IBAction func buttneg(_ sender: AnyObject) {
        if(currentNumber.range(of: "-") == nil){
            currentNumber = "-" + currentNumber
            updateDisplay(updatedRead: currentNumber)
        }
    }
    
    //functions for when a operator button is pressed
    @IBAction func opButtons(_ sender: AnyObject){
       //sets the current operator to the name of the button pressed
        currentOperator = sender.currentTitle!!
        firstNumber = Double(currentNumber)
        currentNumber = ""
        updateDisplay(updatedRead: currentNumber)
    }
    
    
    

    @IBAction func buttequals(_ sender: AnyObject) {
        var outputNumber: Double = 0
        
        //sets the current Number to secondNumber, case for if the current number is empty
        if(currentNumber.isEmpty){secondNumber = 0}else{secondNumber = Double(currentNumber)}
        
        //cases for all operators, performs operation and outputs to outputNumber
        switch(currentOperator){
            case "x": outputNumber = firstNumber! * secondNumber!
            case "/": outputNumber = firstNumber! / secondNumber!
            case "+": outputNumber = firstNumber! + secondNumber!
            case "-": outputNumber = firstNumber! - secondNumber!
            default: print("Invalid Operator")
        }
        updateDisplay(updatedRead: String(outputNumber))
        firstNumber = outputNumber
        }
}

