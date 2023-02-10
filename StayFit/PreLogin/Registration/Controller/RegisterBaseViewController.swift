//
//  RegisterBaseViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import UIKit
///this class is used to register new user
class RegisterBaseViewController: BaseViewController {

    //MARK: - IBOutles Declaration
    @IBOutlet weak var lblHeyThere: UILabel!
    @IBOutlet weak var lblCreateAccount: UILabel!
    @IBOutlet weak var tflFirst: CustomTextField!
    @IBOutlet weak var tflSecond: CustomTextField!
    @IBOutlet weak var tflThird: CustomTextField!
    @IBOutlet weak var tflFourth: CustomTextField!
    @IBOutlet weak var lblor: UILabel!
    @IBOutlet weak var btnRegister: MBButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnFB: UIButton!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var btnCheckbox: UIButton!
    
    
    //MARK: - Variable Declaration
    let MBIcon = MBFontello.shared
    var strTermsUncheck: NSMutableAttributedString!
    var strTermsCheck: NSMutableAttributedString!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    /// function call to setup UI
    func setupUI()
    {
        //Setup Textfield
        setupTextField(textField: tflFirst, placeholder: "First Name", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins, icon: MBIcon.icon_user)
        setupTextField(textField: tflSecond, placeholder: "Last Name", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins, icon: MBIcon.icon_user)
        setupTextField(textField: tflThird, placeholder: "Email", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins, icon: MBIcon.icon_mail)
        setupTextField(textField: tflFourth, placeholder: "Password", fontSize: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins, icon: MBIcon.Ic_Lock)
        
        //Setup UILabel
        setupUILabel(label: lblLogin, lblText: "Already have an Account? Login", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        setupUILabel(label: lblHeyThere, lblText: "Hey There,", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        setupUILabel(label: lblCreateAccount, lblText: "Create an Account", size: ThemeConstants.shared.FontSizeXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        //Setup Button
        //gradient color
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)

        //Setup buttons
        self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnRegister, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Register")
        btnRegister.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
        
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
        
        let fontelloFont = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXL, fontName: ThemeConstants.shared.FontFontello)
        let font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        let colorBlack = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack)
        
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
    }
    
    @IBAction func btnCheckboxTapped(_ sender: UIButton) {
        //Perform action without animation
        UIView.performWithoutAnimation {
            //Handle the checkbox
            if btnCheckbox.title(for: .normal) == MBFontello.shared.ic_checkbox_ticked {
                btnCheckbox.setTitle(MBFontello.shared.ic_checkbox_untick, for: .normal)
                lblTerms.attributedText = strTermsUncheck
            }
            else {
                btnCheckbox.setTitle(MBFontello.shared.ic_checkbox_ticked, for: .normal)
                lblTerms.attributedText = strTermsCheck
            }
        }
    }
    
    @objc func onTapRegister()
    {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.PersonalDetailsVC) as! PersonalDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
