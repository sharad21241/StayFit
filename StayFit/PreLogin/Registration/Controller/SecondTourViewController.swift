//
//  SecondTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 12/01/23.
//

import UIKit
///This is customer onboarding view controller
class SecondTourViewController: BaseViewController {
    //MARK: - IBOutlet Declarations
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    //MARK: - Variable Declaration
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    
    //MARK: - User defined methods
    /// function call to update UI
    func updateUI()
    {
        //setup UILabels
        setupUILabel(label: lblTitle, lblText: "Get Burn", size: ThemeConstants.shared.FontSizeL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        setupUILabel(label: lblDetails, lblText: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever", size: ThemeConstants.shared.FontSizeXS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
    }

    //MARK: - IBActions
    /// function calls on tap of next button
    /// - Parameter sender: sender description
    @IBAction func btnNext(_ sender: Any) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.ThirdTourViewController) as! ThirdTourViewController
        //self.navigationController?.pushViewController(nextVC, animated: true)
        Constants.shared.appDel.rootNavigation.pushViewController(nextVC, animated: true)
    }
}
