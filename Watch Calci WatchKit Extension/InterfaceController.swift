//
//  InterfaceController.swift
//  Watch Calci WatchKit Extension
//
//  Created by Vikas R S on 8/12/18.
//  Copyright © 2018 Vikas Radhakrishna Shetty. All rights reserved.
//

import WatchKit
import Foundation

enum Actions
{
   case ADD
   case SUB
   case MUL
   case DIV
   case EQUALS
   case CLEAR

}

class InterfaceController: WKInterfaceController {
    
    var previousAction:Actions = Actions.CLEAR
    
    var firstNumber:Int64 = 0
    
    var secondNumber:Int64 = 0
    
    @IBOutlet var calculationDisplayLabel: WKInterfaceLabel!
    
    @IBAction func clickedNumber0()
    {
        clickedNumber(num: 0)
    }
    @IBAction func clickedNumber1()
    {
        clickedNumber(num: 1)
    }
    @IBAction func clickedNumber2()
    {
        clickedNumber(num: 2)
    }
    @IBAction func clickedNumber3()
    {
        clickedNumber(num: 3)
    }
    @IBAction func clickedNumber4()
    {
        clickedNumber(num: 4)
    }
    @IBAction func clickedNumber5()
    {
        clickedNumber(num: 5)
    }
    @IBAction func clickedNumber6()
    {
        clickedNumber(num: 6)
    }
    @IBAction func clickedNumber7()
    {
        clickedNumber(num: 7)
    }
    @IBAction func clickedNumber8()
    {
        clickedNumber(num: 8)
    }
    @IBAction func clickedNumber9()
    {
        clickedNumber(num: 9)
    }
    
    func clickedNumber(num:Int)
    {
        if (firstNumber != 0 && previousAction != Actions.EQUALS)
        {
           let concatData = "\(firstNumber)\(num)"
            
            guard let concatNumber:Int64 = Int64(concatData) else
            {
                firstNumber = 0
                secondNumber = 0
                self.calculationDisplayLabel.setText("Number too large")
                return
            }
            
            firstNumber = concatNumber
            
            formattedNumberDisplay(num: firstNumber)
            print(firstNumber)
        }
        else
        {
            if(firstNumber != 0)
            {
                secondNumber = firstNumber
                
                if (previousAction == Actions.EQUALS)
                {
                    previousAction = Actions.CLEAR
                }
            }
            let concatData = "\(num)"
            
            guard let concatNumber:Int64 = Int64(concatData) else
            {
                self.calculationDisplayLabel.setText("Number too large")
                return
            }
            
            firstNumber = concatNumber
            formattedNumberDisplay(num: firstNumber)
            print(firstNumber)
            

        }
        
    }
    
    @IBAction func clickedMultiplyButton()
    {
        previousAction = Actions.MUL
        actionToBeTaken(mode: previousAction)
    }
    
    
    @IBAction func clickedDivideButton()
    {
        previousAction = Actions.DIV
        actionToBeTaken(mode: previousAction)
    }
    
    @IBAction func clickedPlusButton()
    {
        previousAction = Actions.ADD
        actionToBeTaken(mode: previousAction)
    }
    
    
    @IBAction func clickedMinusButton()
    {
        previousAction = Actions.SUB
        actionToBeTaken(mode: previousAction)
    }
    
    
    @IBAction func clickedClearButton()
    {
        previousAction = Actions.CLEAR
        actionToBeTaken(mode: previousAction)
    }
    
    @IBAction func clickedEqualsButton()
    {
        actionToBeTaken(mode: previousAction)
        
        firstNumber = secondNumber
        
        secondNumber = 0
        
        previousAction = Actions.EQUALS
    }
    
    func actionToBeTaken(mode:Actions)
    {
        if(mode == Actions.ADD)
        {
            secondNumber = firstNumber + secondNumber
            
        }
        else if(mode == Actions.SUB)
        {
            if(secondNumber != 0)
            {
                secondNumber = secondNumber - firstNumber
            }
            else
            {
                secondNumber = firstNumber - secondNumber
            }
            
            
        }
        else if(mode == Actions.MUL)
        {
            if(secondNumber != 0)
            {
                secondNumber = secondNumber * firstNumber
            }
            else
            {
                secondNumber = firstNumber
            }
        }
        else if (mode == Actions.DIV)
        {
            if (secondNumber != 0)
            {
                if(firstNumber == 0)
                {
                    calculationDisplayLabel.setText("Error")
                    firstNumber = 0
                    secondNumber = 0
                    return
                }
                else
                {
                    secondNumber = secondNumber / firstNumber
                }
               
            }
            else
            {
                secondNumber = firstNumber
            }
            
        }
        else if(mode == Actions.CLEAR)
        {
            secondNumber = 0
            
        }
        
        firstNumber = 0
        formattedNumberDisplay(num: secondNumber)
    
    }

    // function for number formatting
    func formattedNumberDisplay(num:Int64)
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = NSNumber(value: num)
        let stringValueOfFormattedNumber = formatter.string(from: formattedNumber)
         calculationDisplayLabel.setText(stringValueOfFormattedNumber)
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        calculationDisplayLabel.setText("\(firstNumber)")
        
    }


}
