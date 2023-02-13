//
//  FourthTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 12/01/23.
//

import UIKit
///This is customer onboarding view controller
class FourthTourViewController: BaseViewController {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    //MARK: - Variable Declaration

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    
    //MARK: - User Defined methods
    /// function call to update ui
    func updateUI()
    {
        //Setup UILabels
        setupUILabel(label: lblTitle, lblText: "Improve Sleep Quality", size: ThemeConstants.shared.FontSizeL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        setupUILabel(label: lblDetails, lblText: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning", size: ThemeConstants.shared.FontSizeXS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
    }

    /// Next button action
    /// - Parameter sender: sender description
    @IBAction func btnNext(_ sender: Any) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.RegisterBaseViewController) as! RegisterBaseViewController
        //self.navigationController?.pushViewController(nextVC, animated: true)
        Constants.shared.appDel.rootNavigation.setViewControllers([nextVC], animated: true)
        Constants.shared.appDel.window?.rootViewController = Constants.shared.appDel.rootNavigation
    }
    
}
