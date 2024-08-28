//
//  SignUpViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 15/06/23.
//

import UIKit

protocol SignUpDelegate {
    func passCredentialsDetails(userName: String, password: String)
}

class SignUpViewController: BaseViewController {

    @IBOutlet weak var tflPassword: CustomTextField!
    
    @IBOutlet weak var tflUsername: CustomTextField!
    
    @IBOutlet weak var btnOk: MBButton!
    
    @IBOutlet weak var btnCheckbox: UIButton!
    
    @IBOutlet weak var lblTerms: UILabel!
    
    let MBIcon = MBFontello.shared
    
    var delegate: SignUpDelegate?
    
    var strTermsUncheck: NSMutableAttributedString!
    
    var strTermsCheck: NSMutableAttributedString!
    
    var isTermsChecked = false
    
    fileprivate var objRegistrationPresenter = RegistrationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
        objRegistrationPresenter.attachView(self)
    }
    
    func updateContent() {
        
        let fontelloFont = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXL, fontName: ThemeConstants.shared.FontFontello)
        let font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        
        tflUsername.tag = 0
        tflPassword.tag = 1
        tflPassword.keyboardType = .numberPad
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnCheckBoxTapped(_:)))
        lblTerms.addGestureRecognizer(tapGesture)
        lblTerms.isUserInteractionEnabled = true
        
        self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnOk, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Sign Up")
        
        btnOk.setStateToButton(buttonState: .Inactive)
    }
    
    //Function call to validation
    func validateData() -> Bool
    {
        if self.tflUsername.text == "" {
            btnOk.setStateToButton(buttonState: .Inactive)
            return false
        }
        if self.tflPassword.text == "" {
            btnOk.setStateToButton(buttonState: .Inactive)
            return false
        }
        if isTermsChecked == false {
            btnOk.setStateToButton(buttonState: .Inactive)
            return false
        }
        btnOk.setStateToButton(buttonState: .Active)
        return true
    }
    
    // function call to save registration details in db
    func calToRegister(with closure: @escaping () -> Void)
    {
        let data = User(email: self.tflUsername.text ?? "", password: self.tflPassword.text ?? "")
        self.objRegistrationPresenter.registerUser(userData: data)
    }
    
    func showAlert(title: String = "", message: String, showButton: ButtonToShow = .Center) {
        let storyboard = UIStoryboard(name: Storyboard.shared.MBAlert, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.MBAlertVC) as! MBAlertVC
        //vc.delegate = self
        vc.whichButtonToShow = showButton
        vc.titleString = title
        vc.message = message
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnCheckBoxTapped(_ sender: UIButton) {
        //Perform action without animation
        UIView.performWithoutAnimation {
            //Handle the checkbox
            if btnCheckbox.title(for: .normal) == MBFontello.shared.ic_checkbox_ticked {
                btnCheckbox.setTitle(MBFontello.shared.ic_checkbox_untick, for: .normal)
                lblTerms.attributedText = strTermsUncheck
                isTermsChecked = false
            }
            else {
                btnCheckbox.setTitle(MBFontello.shared.ic_checkbox_ticked, for: .normal)
                lblTerms.attributedText = strTermsCheck
                isTermsChecked = true
            }
            let _ = self.validateData()
        }
    }
    
    @IBAction func btnOk(_ sender: UIButton) {
        if validateData() {
            calToRegister(with: {
                self.showAlert(title: "Yay!!", message: "Registered Successfully!")
            })
        } else {
            showAlert(title: "", message: "Please fill all the details")
        }
    }
}
extension SignUpViewController: UITextFieldDelegate {
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
        self.delegate?.passCredentialsDetails(userName: tflUsername.text ?? "", password: tflPassword.text ?? "")
    }
}

extension SignUpViewController:  RegistrationView {
    func successRegister() {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.FirstTourViewController) as! FirstTourViewController
        Constants.shared.appDel.rootNavigation.pushViewController(vc, animated: true)
    }
    
    func showError(errorMessage: String) {
        self.showAlert(title: "", message: errorMessage)
    }
    
    func showLoader() {
        self.displayLoader()
    }
    
    func hideLoader() {
        self.dismissLoader()
    }
}
