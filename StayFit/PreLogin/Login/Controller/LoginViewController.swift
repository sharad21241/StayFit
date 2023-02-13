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
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var lblor: UILabel!
    
    //MARK: - Variable Declaration
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    //MARK: - User defined methods
    /// setup screen ui
    func setupUI()
    {
        //Setup labels
        self.setupUILabel(label: lblName, lblText: "Hey there,", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        self.setupUILabel(label: lblWlcmback, lblText: "Welcome Back", size: ThemeConstants.shared.FontSizeXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        self.setupUILabel(label: lblRegister, lblText: "Don’t have an account yet? Register", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        self.setupUILabel(label: lblForgot, lblText: "Forgot your password?", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        self.setupUILabel(label: lblor, lblText: "Or", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        
        //Setup Textfields
        self.setupTextField(textField: tfuserName, placeholder: "Email", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        self.setupTextField(textField: tfPassword, placeholder: "Password", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins, icon: MBFontello.shared.Ic_Lock)
        
        tfPassword.isSecureTextEntry = true
        
        //Setup Button
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)

        //Setup buttons
        self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnLogin, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXXL, title: "Login", isAttributed: true, icon: MBFontello.shared.icon_login, isIconFirst: true)
        
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
        
        btnEye.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.FontFontello)
        btnEye.setTitle(MBFontello.shared.ic_eye, for: .normal)
        btnEye.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)
        btnEye.setTitleColor(Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray), for: .normal)
        
    }
    
    //MARK: -IBAction methods
    /// funcion call to show hide password
    /// - Parameter sender: UIButton
    @IBAction func btnEye(_ sender: UIButton) {
        if btnEye.titleLabel?.text == MBFontello.shared.ic_eye {
            btnEye.setTitle(MBFontello.shared.ic_eye_off, for: .normal)
            tfPassword.isSecureTextEntry = false
        }
        else {
            btnEye.setTitle(MBFontello.shared.ic_eye, for: .normal)
            tfPassword.isSecureTextEntry = true
        }
    }
    
    /// function call for button tap action
    /// - Parameter sender: UIButton
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboard.shared.Login, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.WelcomeUserVC) as! WelcomeUserVC
        //self.navigationController?.pushViewController(vc, animated: true)
        Constants.shared.appDel.rootNavigation.pushViewController(vc, animated: true)
    }
}
