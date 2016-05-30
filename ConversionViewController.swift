//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by John Cook on 5/29/16.
//  Copyright © 2016 John Cook. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField:    UITextField!
    @IBOutlet var background:   UIView!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue:    Double? {
        if let value = fahrenheitValue {
            return (value-32) * (5/9)
        } else {
            return nil
        }
    }
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("ConversionViewController loaded its view.")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        // dark mode
        
        // if after 5pm set background color to dark gray
        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        if (hour > 16) {
            background.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, number = numberFormatter.numberFromString(text) {
            fahrenheitValue = number.doubleValue
        } else {
            fahrenheitValue = nil
        }
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                   replacementString string: String) -> Bool {
        let currentLocale    = NSLocale.currentLocale()
        let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        
        let existingTextHasDecimalSeparator    = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)
        
        let s = string as NSString
        for i in 0..<s.length {
            let c = s.characterAtIndex(i)
            if NSCharacterSet.letterCharacterSet().characterIsMember(c) {
                return false
            }
        }
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false;
        } else {
            return true
        }
    }
}
