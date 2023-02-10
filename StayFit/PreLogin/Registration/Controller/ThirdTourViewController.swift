//
//  ThordTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 12/01/23.
//

import UIKit
///This is customer onboarding view controller
class ThirdTourViewController: BaseViewController {

    //MARK: - IBOutlets Declaration
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    //MARK: - Variable Declaration
 
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    //MARK: - User defined methods
    
    /// function call to setup UI
    func updateUI()
    {
        //Setup UILabels
        setupUILabel(label: lblTitle, lblText: "Eat Well", size: ThemeConstants.shared.FontSizeL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        setupUILabel(label: lblDetails, lblText: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun", size: ThemeConstants.shared.FontSizeXS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
    }
    
    //MARK: - IBActions
    /// function calls on tap of next button
    /// - Parameter sender: sender description
    @IBAction func btnNext(_ sender: Any) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.FourthTourViewController) as! FourthTourViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
