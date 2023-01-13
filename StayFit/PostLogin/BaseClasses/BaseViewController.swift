//
//  BaseViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/01/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    func setupTextField(textField: CustomTextField, placeholder: String, fontSize: String, fontName: String, icon: String = MBFontello.shared.icon_user) {
        textField.placeholder = placeholder
        textField.font = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.floatPlaceholderFont = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.dtLayer.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray).cgColor
        textField.dtborderStyle = .rounded
        Utils.shared.addIconToTextField(textfield: textField, icon: icon)
        textField.dtLayer.borderWidth = 0
    }
    
    func setupButtonWithGradient(firstColor: UIColor, SecondColor: UIColor, btn: MBButton, btnType: ButtonTypeFormat, fontName: String, fontSize: String, title: String)
    {
        let gradient = CAGradientLayer(start: .centerLeft, end: .centerRight, colors: [firstColor.cgColor, SecondColor.cgColor], type: .axial)
        gradient.frame = btn.layer.bounds
        //btn.setButton(buttonType: btnType)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = Utils.shared.getSpecificFont(size: fontSize)
        btn.layer.addSublayer(gradient)
        btn.layer.borderWidth = 1
        btn.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        btn.titleLabel?.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        btn.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack).cgColor
        Utils.shared.cornerRadiusTo(control: btn, radius: 30)
    }
    
    func setupUILabel(label: UILabel, lblText: String, size: String, name: String, color: String) {
        label.font = Utils.shared.getSpecificFont(size: size, fontName: name)
        label.text = lblText
        label.textColor = Utils.shared.convertHexColor(name: color)
    }
    
    /// Function to get attributed string
    ///
    /// - Parameters:
    ///   - string: String for adding attributes
    ///   - font: Font for the string
    /// - Returns: Attributed string with custom font
    func attributedString(_ string: String, font: UIFont, color: UIColor) -> NSAttributedString {
        
        //Set attributed text to label description
        let strAttributedText = NSMutableAttributedString(string: string)
        
        //Add attributes
        strAttributedText.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: string.count))
        strAttributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: string.count))
        
        return strAttributedText
    }
}