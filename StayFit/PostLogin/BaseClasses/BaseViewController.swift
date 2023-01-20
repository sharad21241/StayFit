//
//  BaseViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/01/23.
//

import UIKit

///this is a base class
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// function call to customize textfield
    /// - Parameters:
    ///   - textField: textField description
    ///   - placeholder: placeholder description
    ///   - fontSize: fontSize description
    ///   - fontName: fontName description
    ///   - icon: icon description
    func setupTextField(textField: CustomTextField, placeholder: String, fontSize: String, fontName: String, icon: String = MBFontello.shared.icon_user) {
        textField.placeholder = placeholder
        textField.font = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.floatPlaceholderFont = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.dtLayer.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightTextFieldBG).cgColor
        textField.dtborderStyle = .rounded
        Utils.shared.addIconToTextField(textfield: textField, icon: icon)
        textField.dtLayer.borderWidth = 0
        Utils.shared.cornerRadiusTo(control: textField, radius: 15)
    }
    
    /// function call to customize uibutton
    /// - Parameters:
    ///   - firstColor: firstColor description
    ///   - SecondColor: SecondColor description
    ///   - btn: btn description
    ///   - btnType: btnType description
    ///   - fontName: fontName description
    ///   - fontSize: fontSize description
    ///   - title: title description
    ///   - isAttributed: isAttributed description
    ///   - icon: icon description
    func setupButtonWithGradient(firstColor: UIColor, SecondColor: UIColor, btn: MBButton, btnType: ButtonTypeFormat, fontName: String, fontSize: String, title: String, isAttributed: Bool = false, icon: String = "")
    {
        let gradient = CAGradientLayer(start: .centerLeft, end: .centerRight, colors: [firstColor.cgColor, SecondColor.cgColor], type: .axial)
        let font = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        
        gradient.frame = btn.layer.bounds
        btn.layer.addSublayer(gradient)
        
        btn.layer.borderWidth = 0
        btn.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        btn.titleLabel?.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        btn.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack).cgColor
        Utils.shared.cornerRadiusTo(control: btn, radius: 30)
        
        if isAttributed {
            let fontello = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXXL, fontName: ThemeConstants.shared.FontFontello)
            
            let attributedText = NSMutableAttributedString()
            attributedText.append(attributedString(title, font: font))
            attributedText.append(attributedString(" ", font: font)) //Add Space between text & icon
            attributedText.append(attributedString(icon, font: fontello))
            btn.setAttributedTitle(attributedText, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 40, left: 0, bottom: 50, right: 0)
        }
        else {
            btn.setTitle(title, for: .normal)
            btn.titleLabel?.font = font
        }
    }
    
    /// function call to customize UI label
    /// - Parameters:
    ///   - label: label description
    ///   - lblText: lblText description
    ///   - size: size description
    ///   - name: name description
    ///   - color: color description
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
    func attributedString(_ string: String, font: UIFont) -> NSAttributedString {
        
        //Set attributed text to label description
        let strAttributedText = NSMutableAttributedString(string: string)
        
        //Add attributes
        strAttributedText.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: string.count))
        let paragraphStyle = NSMutableParagraphStyle()  //Create a paragraph style object
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        strAttributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSRange(location: 0, length: strAttributedText.length))
        
        return strAttributedText
    }
}
