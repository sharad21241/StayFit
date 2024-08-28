//
//  SignInViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 15/06/23.
//

import UIKit

protocol SignInDelegate {
    func credentialsDetails(userName: String, password: String)
}

class SignInViewController: BaseViewController {

    @IBOutlet weak var tflPassword: CustomTextField!
    
    @IBOutlet weak var tflUsername: CustomTextField!
    
    @IBOutlet weak var btnSignIn: MBButton!
    
    @IBOutlet weak var lblTerms: UILabel!
    
    @IBOutlet weak var btnCheckBox: UIButton!
    
    @IBOutlet weak var btnOk: MBButton!
    
    let MBIcon = MBFontello.shared
    
    var delegate: SignInDelegate?
    
    var strTermsUncheck: NSMutableAttributedString!
    
    var strTermsCheck: NSMutableAttributedString!
    
    var isTermsChecked = false
    
    //Presenters
    fileprivate var objLoginPresenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
        objLoginPresenter.attachView(self)
        // Do any additional setup after loading the view.
    }
    
    func updateContent() {
        let fontelloFont = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXL, fontName: ThemeConstants.shared.FontFontello)
        let font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        
        tflUsername.tag = 0
        tflPassword.tag = 1
        setupTextField(textField: tflUsername, placeholder: "Username", fontSize: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.Poppins, icon: MBIcon.icon_mail)
        setupTextField(textField: tflPassword, placeholder: "Password", fontSize: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.Poppins, icon: MBIcon.Ic_Lock)
        
        //Unchecked
        strTermsUncheck = NSMutableAttributedString()
        strTermsUncheck.append(attributedString(MBFontello.shared.ic_checkbox_untick, font: fontelloFont))
        strTermsUncheck.append(attributedString(" By continuing you accept our Privacy Policy and Term of Use", font: font))
        //Checked
        strTermsCheck = NSMutableAttributedString()
        strTermsCheck.append(attributedString(MBFontello.shared.ic_checkbox_ticked, font: fontelloFont))
        strTermsCheck.append(attributedString(" By continuing you accept our Privacy Policy and Term of Use", font: font))

        lblTerms.attributedText = strTermsUncheck
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnCheckboxTapped(_:)))
        lblTerms.addGestureRecognizer(tapGesture)
        lblTerms.isUserInteractionEnabled = true
        
        
        self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnSignIn, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Sign In")
        
        
        btnSignIn.addTarget(self, action: #selector(onSignInTapped), for: .touchUpInside)
        btnSignIn.setStateToButton(buttonState: .Inactive)
    }

    // function call to save registration details in db
    func callToLogin(with closure: @escaping () -> Void)
    {
        let data = User(email: self.tflUsername.text ?? "", password: self.tflPassword.text ?? "")
        self.objLoginPresenter.login(userData: data)
    }
    
    /// function call to show popup
    /// - Parameters:
    ///   - title: title description
    ///   - message: message description
    ///   - showButton: showButton description
    func showAlert(title: String = "", message: String, showButton: ButtonToShow = .Center) {
        let storyboard = UIStoryboard(name: Storyboard.shared.MBAlert, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.MBAlertVC) as! MBAlertVC
        vc.delegate = self
        vc.whichButtonToShow = showButton
        vc.titleString = title
        vc.message = message
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
    }
    
    //Function call to validation
    func validateData() -> Bool
    {
        if self.tflUsername.text == "" {
            btnSignIn.setStateToButton(buttonState: .Inactive)
            return false
        }
        if self.tflPassword.text == "" {
            btnSignIn.setStateToButton(buttonState: .Inactive)
            return false
        }
        if isTermsChecked == false {
            btnSignIn.setStateToButton(buttonState: .Inactive)
            return false
        }
        btnSignIn.setStateToButton(buttonState: .Active)
        return true
    }
    
    @IBAction func btnCheckboxTapped(_ sender: UIButton) {
        //Perform action without animation
        UIView.performWithoutAnimation {
            //Handle the checkbox
            if btnCheckBox.title(for: .normal) == MBFontello.shared.ic_checkbox_ticked {
                btnCheckBox.setTitle(MBFontello.shared.ic_checkbox_untick, for: .normal)
                lblTerms.attributedText = strTermsUncheck
                isTermsChecked = false
            }
            else {
                btnCheckBox.setTitle(MBFontello.shared.ic_checkbox_ticked, for: .normal)
                lblTerms.attributedText = strTermsCheck
                isTermsChecked = true
            }
            let _ = self.validateData()
        }
    }
    
    @objc func onSignInTapped()
    {
        if validateData() {
            callToLogin(with: {
                self.showAlert(title: "Yay!!", message: "Login Successful!")
            })
        } else {
            showAlert(title: "", message: "Please fill all the details")
        }
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            if Utils.shared.isValidEmail(textField.text ?? "") {
                // Email format is valid
            } else {
                // Email format is invalid
                showAlert(message: "Invalid email format")
                return
            }
        }
        let _ = validateData()
        //self.delegate?.credentialsDetails(userName: tflUsername.text ?? "", password: tflPassword.text ?? "")
    }
}

extension SignInViewController: buttonDelegate {
    func okButtonTapped() {
        print("\n\nOk Button tapped")
    }
    
    func btnYesTapped() {
        //Do Nothing
    }
}


extension SignInViewController: LoginView {
    func showError(errorMessage: String) {
        showAlert(message: errorMessage)
    }
    
    func showLoader() {
        self.displayLoader()
    }
    
    func hideLoader() {
        self.dismissLoader()
    }
    
    func loginSuccess() {
        let storyboard = UIStoryboard(name: Storyboard.shared.Dashboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.DashboardViewController) as! DashboardViewController
        Constants.shared.appDel.rootNavigation.setViewControllers([vc], animated: true)
        Constants.shared.appDel.window?.rootViewController = Constants.shared.appDel.rootNavigation
    }
}
