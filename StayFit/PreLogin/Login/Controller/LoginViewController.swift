//
//  LoginViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/01/23.
//

import UIKit
///this class is used to login
class LoginViewController: BaseViewController {

    //MARK: - IBOutles Declaraiton
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblWlcmback: UILabel!
    @IBOutlet weak var lblForgot: UILabel!
    @IBOutlet weak var tfPassword: CustomTextField!
    @IBOutlet weak var tfuserName: CustomTextField!
    @IBOutlet weak var btnLogin: MBButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnFB: UIButton!
    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var viwDivider: UIView!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    /// setup screen ui
    func setupUI()
    {
        //Setup labels
        self.setupUILabel(label: lblName, lblText: "Hey there,", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        self.setupUILabel(label: lblWlcmback, lblText: "Welcome Back", size: ThemeConstants.shared.FontSizeXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        self.setupUILabel(label: lblRegister, lblText: "Don’t have an account yet? Register", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        self.setupUILabel(label: lblForgot, lblText: "Forgot your password?", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        
        //Setup Textfields
        self.setupTextField(textField: tfuserName, placeholder: "Email", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        self.setupTextField(textField: tfPassword, placeholder: "Password", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        
        //Setup Button
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)

        //Setup buttons
        self.setupButtonWithGradient(firstColor: firstColor, SecondColor: lastColor, btn: btnLogin, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.FontBold, fontSize: ThemeConstants.shared.FontSizeXXXXL, title: "Login")
        
        //Setup view
        viwDivider.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
        
        //Social Icons
        btnFB.setImage(UIImage(named: "facebook"), for: .normal)
        btnFB.layer.borderWidth = 1
        btnFB.layer.cornerRadius = 20
        btnFB.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray).cgColor
        
        btnGoogle.setImage(UIImage(named: "google"), for: .normal)
        btnGoogle.layer.borderWidth = 1
        btnGoogle.layer.cornerRadius = 20
        btnGoogle.sizeToFit()
        btnGoogle.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray).cgColor
    }
    
}
