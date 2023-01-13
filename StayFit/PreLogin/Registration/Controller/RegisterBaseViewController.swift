//
//  RegisterBaseViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import UIKit

class RegisterBaseViewController: UIViewController {

    @IBOutlet weak var lblHeyThere: UILabel!
    @IBOutlet weak var lblCreateAccount: UILabel!
    @IBOutlet weak var tflFirst: CustomTextField!
    @IBOutlet weak var tflSecond: CustomTextField!
    @IBOutlet weak var tflThird: CustomTextField!
    @IBOutlet weak var tflFourth: CustomTextField!
    @IBOutlet weak var lblor: UILabel!
    @IBOutlet weak var btnRegister: MBButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI()
    {
        setupTextField(textField: tflFirst, placeholder: "First Name", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.FontRegular)
        setupTextField(textField: tflSecond, placeholder: "Last Name", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.FontRegular)
        setupTextField(textField: tflThird, placeholder: "Email", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.FontRegular)
        setupTextField(textField: tflFourth, placeholder: "Password", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.FontRegular)
        
        
        tflFirst.placeholder = "First Name"
        
        //Colors for gradient
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        
        //Setup Button
        self.setupButtonWithGradient(firstColor: firstColor, SecondColor: lastColor, btn: btnRegister, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.FontBold, fontSize: ThemeConstants.shared.FontSizeXXXXL, title: "Register")
        
        Utils.shared.cornerRadiusTo(control: btnRegister, radius: 30)
    }
    
    func setupTextField(textField: CustomTextField, placeholder: String, fontSize: String, fontName: String) {
        textField.placeholder = placeholder
        textField.font = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.floatPlaceholderFont = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.dtLayer.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray).cgColor
        textField.dtborderStyle = .rounded
        textField.dtLayer.borderWidth = 0
    }
    
    func setupButtonWithGradient(firstColor: UIColor, SecondColor: UIColor, btn: MBButton, btnType: ButtonTypeFormat, fontName: String, fontSize: String, title: String)
    {
        let gradient = CAGradientLayer(start: .centerLeft, end: .centerRight, colors: [firstColor.cgColor, SecondColor.cgColor], type: .axial)
        gradient.frame = btn.layer.bounds
        btn.setButton(buttonType: btnType)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = Utils.shared.getSpecificFont(size: fontSize)
        btn.layer.addSublayer(gradient)
        
    }
}
