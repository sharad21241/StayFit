//
//  OnboardingViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import UIKit
///This class is used to customer onboarding
class OnboardingViewController: BaseViewController {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblCaption: UILabel!
    @IBOutlet weak var btnGetStarted: MBButton!
    @IBOutlet weak var lblFitNest: UILabel!
    @IBOutlet weak var lblX: UILabel!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - User Defined Methods
    /// function call to Update UI
    func updateUI()
    {
        //Setup UI labels
        setupUILabel(label: lblFitNest, lblText: "Fitnest", size: ThemeConstants.shared.FontSizeXXXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        setupUILabel(label: lblX, lblText: "X", size: ThemeConstants.shared.FontSizeXXXXXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorWhite)
        
        setupUILabel(label: lblCaption, lblText: "Everybody Can Train", size: ThemeConstants.shared.FontSizeXXS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        
        //Setup button
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)

        setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnGetStarted, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Get Started!", borderWidth: 1)
        btnGetStarted.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
    }
    
    //MARK: IBActions
    /// Function call for getStarted button action
    @objc func getStartedTapped() {
        let sbRegister = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vcRegister = sbRegister.instantiateViewController(withIdentifier: VCIdentifier.shared.FirstTourViewController) as! FirstTourViewController
        Constants.shared.appDel.rootNavigation.setViewControllers([vcRegister], animated: true)
        Constants.shared.appDel.window?.rootViewController = Constants.shared.appDel.rootNavigation
    }
}
