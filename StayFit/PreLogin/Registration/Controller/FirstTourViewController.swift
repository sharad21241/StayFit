//
//  FirstTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 11/01/23.
//

import UIKit
///This is customer onboarding view controller
class FirstTourViewController: UIViewController {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    //MARK: - Variable Declaration
    let fontBold = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeL, fontName: ThemeConstants.shared.FontBold)
    let fontRegular = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.FontRegular)
    let colorBlack = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack)
    let colorGray = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)
    
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
        setupLabel(label: lblTitle, font: fontBold, color: colorBlack, text: "Track Your Goal")
        setupLabel(label: lblDetails, font: fontRegular, color: colorGray, text: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals")
    }
    
    /// Function call to setup uilabels
    /// - Parameters:
    ///   - label: label description
    ///   - font: font description
    ///   - color: color description
    ///   - text: text description
    func setupLabel(label: UILabel, font: UIFont, color: UIColor, text: String)
    {
        label.font = font
        label.textColor = color
        label.text = text
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
