//
//  WelcomeUserVC.swift
//  StayFit
//
//  Created by Sharad Gangurde on 07/02/23.
//

import UIKit

class WelcomeUserVC: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnGoToHome: MBButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupContent()
    }
    
    func setupContent()
    {
        let fontRegular = ThemeConstants.shared.Poppins
        let fontBold = ThemeConstants.shared.PoppinsSemiBold
        let fontSizeM = ThemeConstants.shared.FontSizeM
        let fontSizeXL = ThemeConstants.shared.FontSizeXL
        
        let colorBlack = ThemeConstants.shared.FontColorBlack
        let colorGray = ThemeConstants.shared.FontColorGray
        
        //Setup Labels
        //1 - Title Label
        setupUILabel(label: lblTitle, lblText: "Welcome, Stefani", size: fontSizeXL, name: fontBold, color: colorBlack)
        //2 - Subtitle Label
        setupUILabel(label: lblSubTitle, lblText: "You are all set now, let’s reach your goals together with us", size: fontSizeM, name: fontRegular, color: colorGray)
        
        //Setup Button
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        //Button
        self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnGoToHome, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXL, title: "Go To Home")
        
    }
    
    //MARK: - IBAction methods
    @IBAction func btnContinue(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboard.shared.Dashboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.DashboardViewController) as! DashboardViewController
        self.navigationController?.pushViewController(vc, animated: true)
//        Constants.shared.appDel.rootNavigation.setViewControllers([vc], animated: true)
//        Constants.shared.appDel.window?.rootViewController = Constants.shared.appDel.rootNavigation
        
    }
}
