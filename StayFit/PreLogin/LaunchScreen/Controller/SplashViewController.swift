//
//  SplashViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var lblCaption: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
    }
    
    func updateUI()
    {
        lblCaption.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXS)
        lblCaption.text = "Everybody Can Train"
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.OnboardingViewController) as! OnboardingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
