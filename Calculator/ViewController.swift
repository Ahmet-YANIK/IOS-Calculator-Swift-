//
//  ViewController.swift
//  Calculator
//
//  Created by ahmet on 25.05.21.
//

import UIKit


class ViewController: UIViewController {


    
    @IBOutlet weak var labelDataEntry: UILabel!
    @IBOutlet weak var labelAnswer: UILabel!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var numberSeven: UIButton!
    @IBOutlet weak var numberEight: UIButton!
    @IBOutlet weak var numberNine: UIButton!
    @IBOutlet weak var buttonMult: UIButton!
    @IBOutlet weak var numberFour: UIButton!
    @IBOutlet weak var numberFive: UIButton!
    @IBOutlet weak var numberSix: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var numberOne: UIButton!
    @IBOutlet weak var numberTwo: UIButton!
    @IBOutlet weak var numberThree: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var numberZero: UIButton!
    @IBOutlet weak var buttoncoma: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonSquare: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonName: [UIButton] = [buttonSquare, buttonAC, buttonDivide, buttonDelete,numberSeven,numberEight, numberNine, buttonMult, numberFour, numberFive, numberSix, buttonMinus,numberOne, numberTwo, numberThree, buttonPlus, numberZero, buttoncoma, buttonEqual]
        for array in buttonName{
            
            array.layer.cornerRadius = array.frame.size.height/4
        }

    }
    var firstData = 0.0
    var secendData  = 0.0
    var control = 0
    var answer = 0.0
    var check1 = 0
    
   
    //MARK: - Number Pressed
    
    @IBAction func numberPressed(_ sender: UIButton) {
        checkFirstTab()
        labelDataEntry.text?.append(sender.currentTitle!)
        correctLabelAnswer()
    }
    
    
    @IBAction func buttonComaPressed(_ sender: UIButton) {
        if checkKoma(labelString: labelDataEntry.text!) == 1 {
            if labelDataEntry.text == "" {
                labelDataEntry.text?.append("0.")
            } else {
                labelDataEntry.text?.append(".")
            }
        }
        correctLabelAnswer()
    }
    
    //MARK: - Button Pressed
    var secendOp = ""
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if labelDataEntry.text == "" {
            labelDataEntry.text = "0"
        }else {}
        
        if secendOp == "" {
           calculate(op: sender.currentTitle!)
            secendOp = sender.currentTitle!
        } else {
           calculate(op: secendOp)
            secendOp = sender.currentTitle!
        }
            labelAnswer.text = checkIntDouble(data: firstData)
        
        labelDataEntry.text = "0"
        switch sender.currentTitle {
        case "+":
            control = 1
        case "-":
            control = 2
        case "x":
            control = 3
        default:
            control = 4
        }
    }

    
    @IBAction func buttonEqualPressed(_ sender: UIButton) {
        if labelDataEntry.text == "" {
            labelDataEntry.text = "0"
        }else {}
        switch control {
        case 1:
            answer = firstData + Double(labelDataEntry.text!)!
            labelAnswer.text = checkIntDouble(data: answer)
            control = 0
            firstData = 0
            secendData = 0
            secendOp = ""
        case 2:
            answer = firstData - Double(labelDataEntry.text!)!
            labelAnswer.text = checkIntDouble(data: answer)
            control = 0
            firstData = 0
            secendData = 0
            secendOp = ""
        case 3:
            answer = firstData * Double(labelDataEntry.text!)!
            labelAnswer.text = checkIntDouble(data: answer)
            control = 0
            firstData = 0
            secendData = 0
            secendOp = ""
        case 4:
            answer = firstData / Double(labelDataEntry.text!)!
            labelAnswer.text = checkIntDouble(data: answer)
            control = 0
            firstData = 0
            secendData = 0
            secendOp = ""
        default:
            control = 0
            secendOp = ""
            let temp = Double(labelDataEntry.text!)
            labelAnswer.text = checkIntDouble(data: temp! )
        }
        labelDataEntry.text = "0"
        check1 = 0
        
    }
    
    @IBAction func buttonSquarePressed(_ sender: UIButton) {
        switch labelDataEntry.text {
        case "0":
            labelDataEntry.text = "0"
        case "":
            labelDataEntry.text = "0"
        default:
            if control == 0 {
            firstData = Double(labelDataEntry.text!)!
            firstData *= firstData
            labelAnswer.text = checkIntDouble(data: firstData)
                labelDataEntry.text = "0"}
            else {}
        }

    }
    
    @IBAction func buttonAcPressed(_ sender: UIButton) {

        switch control {
        case 0:
            
                labelAnswer.text = "0"
                labelDataEntry.text = "0"
            
        default:
            if labelDataEntry.text == "0" {
                firstData = 0.0
                secendData  = 0.0
                control = 0
                answer = 0.0
                check1 = 0
                labelAnswer.text = "0"
                 labelDataEntry.text = "0"
            } else {
                labelDataEntry.text = "0"
            }
            
        }
    }
    
    @IBAction func buttonDeletePressed(_ sender: UIButton) {
        if labelDataEntry.text == "0" {
            
        } else {
           
            if labelDataEntry.text == "" {
                labelDataEntry.text = "0"
            } else {
                labelDataEntry.text?.removeLast()
                
            }
        }
       
    }
    
    //MARK: - Function Block
    
    
    func checkFirstTab()  {
        if labelDataEntry.text == "0" {
            labelDataEntry.text = ""
        }
    }
    
    func correctLabelAnswer()  {
        if labelAnswer.text != "0" , control == 0 {
            labelAnswer.text = "0"
        } else {}
    }
    func calculate(op: String)  {

        let checkOp = op
        switch checkOp {
        case "+":
            if check1 == 0 {
                firstData = Double(labelDataEntry.text!)!
                check1 = 1

            }else {
                secendData = Double(labelDataEntry.text!)!
                firstData = firstData + secendData
            }
        case "-":
            if check1 == 0 {
                firstData = Double(labelDataEntry.text!)!
                check1 = 1

            }else {
                secendData = Double(labelDataEntry.text!)!
                firstData = firstData - secendData
            }
        case "x":
            if check1 == 0 {
                firstData = Double(labelDataEntry.text!)!
                check1 = 1

            }else {
                secendData = Double(labelDataEntry.text!)!
                firstData = firstData * secendData
            }
        case "/":
            if check1 == 0 {
                firstData = Double(labelDataEntry.text!)!
                check1 = 1

            }else {
                secendData = Double(labelDataEntry.text!)!
                firstData = firstData / secendData
            }
        default:
            labelAnswer.text = "Error"
        }

    }
    
    func checkKoma(labelString: String) -> Int {
        let label = labelString
        var check2 = 0
        var check3 = 0
        for koma in label {
            if koma == "."{
                check2 = 1 + check2
            }
        }
        if check2 <= 0 {
            check3 = 1
        } else {
            check3 = 2
        }
        return check3
    }

    func checkIntDouble(data: Double) -> String {
        if data.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", data)
        } else {
            return String(data)
                }

        }
}

