//
//  RegistrationViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 15/06/23.
//

import UIKit
import CarbonKit

class RegistrationViewController: BaseViewController {

    @IBOutlet weak var lblHeyThere: UILabel!
    @IBOutlet weak var viewBackContainer: UIView!
    @IBOutlet weak var viwContainer: UIView!
//    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblSubtitle: UILabel!
//    @IBOutlet weak var btnSubmit: MBButton!
//    @IBOutlet weak var lblPrivacyPolicy: UILabel!
//    @IBOutlet weak var lblBottom: UILabel!
    
    var objCarbonTab = CarbonTabSwipeNavigation()
    var SignUpVC : SignUpViewController?
    var SignInVC : SignInViewController?
    
    fileprivate var objPresenter = RegistrationPresenter()
    fileprivate var objLoginPresenter = LoginPresenter()
    
    var strTermsUncheck: NSMutableAttributedString!
    var strTermsCheck: NSMutableAttributedString!
    var isTermsChecked = false
    
    private var userName: String?
    private var password: String?
    
    var arrVCTitles = [String]()
    
    var iSelectedTab = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
        self.iSelectedTab = 1
        prepareTabBar()
        objPresenter.attachView(self)
        objLoginPresenter.attachView(self)
        // Do any additional setup after loading the view.
    }
    
    func updateContent()
    {
        let fontelloFont = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXL, fontName: ThemeConstants.shared.FontFontello)
        let font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        //let colorBlack = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack)
        
        //lblBottom.isHidden = true
        
        setupUILabel(label: lblHeyThere, lblText: "Hey There,", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        setupUILabel(label: lblSubtitle, lblText: "Welcome to StayFit", size: ThemeConstants.shared.FontSizeXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
       
        
        //Unchecked
        strTermsUncheck = NSMutableAttributedString()
        strTermsUncheck.append(attributedString(MBFontello.shared.ic_checkbox_untick, font: fontelloFont))
        strTermsUncheck.append(attributedString(" By continuing you accept our Privacy Policy and Term of Use", font: font))
        //Checked
        strTermsCheck = NSMutableAttributedString()
        strTermsCheck.append(attributedString(MBFontello.shared.ic_checkbox_ticked, font: fontelloFont))
        strTermsCheck.append(attributedString(" By continuing you accept our Privacy Policy and Term of Use", font: font))

//        lblPrivacyPolicy.attributedText = strTermsUncheck
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnCheckboxTapped(_:)))
//        lblPrivacyPolicy.addGestureRecognizer(tapGesture)
//        lblPrivacyPolicy.isUserInteractionEnabled = true
//        lblPrivacyPolicy.isHidden = true
//        
//        btnCheckBox.isHidden = true
//        btnSubmit.isHidden = true
        //Setup Button
        //gradient color
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        //Setup buttons
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
//            if self.iSelectedTab == 0 {
//                self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnSubmit, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Sign Up")
//            } else {
//                self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnSubmit, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Sign In")
//            }
//        })
        
//        btnSubmit.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
//        btnSubmit.setStateToButton(buttonState: .Inactive)
        
    }
    
    /// Custom Method to prepare tabbar
    func prepareTabBar() {
        arrVCTitles = [ "Sign UP", "Sign IN"]
        objCarbonTab = CarbonTabSwipeNavigation(items:self.arrVCTitles, delegate: self)
        objCarbonTab.insert(intoRootViewController: self, andTargetView:viwContainer!)
        Utils.shared.setTabBarStyle(objCarbonTab: objCarbonTab, viwController: self, isEqualSize: true)
        objCarbonTab.carbonTabSwipeScrollView.isScrollEnabled = false
        objCarbonTab.delegate = self
    }
    
    // function call to save registration details in db
    func setRegistrationData(with closure: @escaping () -> Void)
    {
        let data = User(email: self.userName ?? "", password: self.password ?? "")
        if iSelectedTab == 0 {
            self.objPresenter.registerUser(userData: data)
        } else {
            self.objLoginPresenter.login(userData: data)
        }
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
//        if self.userName == "" {
//            btnSubmit.setStateToButton(buttonState: .Inactive)
//            return false
//        }
//        if self.password == "" {
//            btnSubmit.setStateToButton(buttonState: .Inactive)
//            return false
//        }
//        if isTermsChecked == false {
//            btnSubmit.setStateToButton(buttonState: .Inactive)
//            return false
//        }
//        btnSubmit.setStateToButton(buttonState: .Active)
        return true
    }
    
    @objc func onTapRegister()
    {
        if validateData() {
            setRegistrationData(with: {
                self.showAlert(title: "Yay!!", message: "Registration Successful!")
            })
        } else {
            showAlert(title: "", message: "Please fill all the details")
        }
    }
    @IBAction func btnGoogleClicked(_ sender: UIButton) {
    }
    @IBAction func btnFBClicked(_ sender: UIButton) {
    }
    
    @IBAction func btnCheckboxTapped(_ sender: UIButton) {
        //Perform action without animation
//        UIView.performWithoutAnimation {
//            //Handle the checkbox
//            if btnCheckBox.title(for: .normal) == MBFontello.shared.ic_checkbox_ticked {
//                btnCheckBox.setTitle(MBFontello.shared.ic_checkbox_untick, for: .normal)
//                lblPrivacyPolicy.attributedText = strTermsUncheck
//                isTermsChecked = false
//            }
//            else {
//                btnCheckBox.setTitle(MBFontello.shared.ic_checkbox_ticked, for: .normal)
//                lblPrivacyPolicy.attributedText = strTermsCheck
//                isTermsChecked = true
//            }
//            let _ = self.validateData()
//        }
    }
}

extension RegistrationViewController: CarbonTabSwipeNavigationDelegate {
    /// carbon swipe delegate method
    ///
    /// - Parameters:
    ///   - carbonTabSwipeNavigation: CarbonTabSwipeNavigation
    ///   - index: index
    /// - Returns: UIViewController
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        let storyBoard = UIStoryboard.init(name: Storyboard.shared.Register, bundle: nil)
        
        switch index {
        case 0:
            // For firebase Analytics
            //FAHelper.shared.FAAnalytics(category: FACategoryName.shared.FAProfile, action: FAAction.shared.FAPageTab, label: FAConstants.shared.FAPersonalDetails)
            SignUpVC = storyBoard.instantiateViewController(withIdentifier: VCIdentifier.shared.SignUpViewController) as? SignUpViewController
            SignUpVC?.delegate = self
            
            self.iSelectedTab = 0
            self.updateContent()
            
            return SignUpVC ?? UIViewController()
        case 1:
             //FAHelper.shared.FAAnalytics(category: FACategoryName.shared.FAProfile, action: FAAction.shared.FAPageTab, label: FAConstants.shared.FABankDetails)
            SignInVC = storyBoard.instantiateViewController(withIdentifier: VCIdentifier.shared.SignInViewController) as? SignInViewController
            SignInVC?.delegate = self
            
            self.iSelectedTab = 1
            self.updateContent()
            
            return SignInVC ?? UIViewController()
            
        default:
            return UIViewController()
        }
    }
}

extension RegistrationViewController:  RegistrationView {
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

extension RegistrationViewController: buttonDelegate {
    func okButtonTapped() {
        print("\n\nOk Button tapped")
    }
    
    func btnYesTapped() {
        //Do Nothing
    }
}

extension RegistrationViewController: SignUpDelegate {
    func passCredentialsDetails(userName: String, password: String) {
        self.userName = userName
        self.password = password
        let _ = self.validateData()
    }
}

extension RegistrationViewController: LoginView {
    func loginSuccess() {
        let storyboard = UIStoryboard(name: Storyboard.shared.Dashboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.DashboardViewController) as! DashboardViewController
        //self.navigationController?.pushViewController(vc, animated: true)
        Constants.shared.appDel.rootNavigation.setViewControllers([vc], animated: true)
        Constants.shared.appDel.window?.rootViewController = Constants.shared.appDel.rootNavigation
    }
}
extension RegistrationViewController: SignInDelegate {
    func credentialsDetails(userName: String, password: String) {
        self.userName = userName
        self.password = password
        let _ = self.validateData()
    }
}

