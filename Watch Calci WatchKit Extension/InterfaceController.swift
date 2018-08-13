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
        if (firstNumber != 0)
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
            
            calculationDisplayLabel.setText(concatData)
            print(firstNumber)
        }
        else
        {
            let concatData = "\(num)"
            
            guard let concatNumber:Int64 = Int64(concatData) else
            {
                self.calculationDisplayLabel.setText("Number too large")
                return
            }
            
            firstNumber = concatNumber
            
            calculationDisplayLabel.setText(concatData)
            print(firstNumber)
        }
        
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
        else if(mode == Actions.CLEAR)
        {
            secondNumber = 0
            
        }
        
        firstNumber = 0
        calculationDisplayLabel.setText("\(secondNumber)")
    
    }

    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        calculationDisplayLabel.setText("\(firstNumber)")
        
    }


}
