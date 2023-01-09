//
//  OnboardingViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var lblCaption: UILabel!
    @IBOutlet weak var btnGetStarted: MBButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    /// function call to Update UI
    func updateUI()
    {
        lblCaption.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXS)
        lblCaption.text = "Everybody Can Train"
        
        btnGetStarted.setButton(buttonType: .ClearColorWhiteTextWithBorder)
        btnGetStarted.setTitle("Get Started!", for: .normal)
    }
}
