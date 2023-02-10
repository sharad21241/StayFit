//
//  FirstTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 11/01/23.
//

import UIKit
///This is customer onboarding view controller
class FirstTourViewController: BaseViewController {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    //MARK: - Variable Declaration
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    
    //MARK: - User Defined Methods
    ///function call to update UI
    func updateUI()
    {
        //Setup Labels
        setupUILabel(label: lblTitle, lblText: "Track Your Goal", size: ThemeConstants.shared.FontSizeL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        setupUILabel(label: lblDetails, lblText: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals", size: ThemeConstants.shared.FontSizeXS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
    }
    
    //MARK: - IBActions
    /// function call to perfom button action
    /// - Parameter sender: sender description
    @IBAction func btnNext(_ sender: UIButton) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.SecondTourViewController) as! SecondTourViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
