//
//  InterfaceController.swift
//  Watch Calci WatchKit Extension
//
//  Created by Vikas R S on 8/12/18.
//  Copyright © 2018 Vikas Radhakrishna Shetty. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    var firstNumber:Int = 0
    
    var secondNumber:Int = 0
    
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
            
            firstNumber = Int(concatData)!
            
            calculationDisplayLabel.setText(concatData)
            print(firstNumber)
        }
        else
        {
            let concatData = "\(num)"
            
            firstNumber = Int(concatData)!
            
            calculationDisplayLabel.setText(concatData)
            print(firstNumber)
        }
        
    }
    
    @IBAction func clickedPlusButton()
    {
        secondNumber = firstNumber + secondNumber
        
        firstNumber = 0
        
        

    }
    
    
    @IBAction func clickedMinusButton() {
    }
    
    
    @IBAction func clickedClearButton() {
    }
    
    @IBAction func clickedEqualsButton()
    {
        secondNumber = firstNumber + secondNumber
        
        calculationDisplayLabel.setText("\(secondNumber)")
        
        firstNumber = 0
    }
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        calculationDisplayLabel.setText("\(firstNumber)")
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
