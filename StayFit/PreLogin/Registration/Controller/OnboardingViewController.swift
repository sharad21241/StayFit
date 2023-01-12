//
//  OnboardingViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import UIKit
///This class is used to customer onboarding
class OnboardingViewController: UIViewController {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblCaption: UILabel!
    @IBOutlet weak var btnGetStarted: MBButton!
    
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
        lblCaption.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXS, fontName: ThemeConstants.shared.FontRegular)
        lblCaption.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)
        lblCaption.text = "Everybody Can Train"
        
        btnGetStarted.setButton(buttonType: .ClearColorWhiteTextWithBorder)
        btnGetStarted.setTitle("Get Started!", for: .normal)
        btnGetStarted.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
    }
    
    //MARK: IBActions
    /// Function call for getStarted button action
    @objc func getStartedTapped() {
        let sbRegister = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vcRegister = sbRegister.instantiateViewController(withIdentifier: VCIdentifier.shared.FirstTourViewController) as! FirstTourViewController
        self.navigationController?.pushViewController(vcRegister, animated: true)
    }
}
