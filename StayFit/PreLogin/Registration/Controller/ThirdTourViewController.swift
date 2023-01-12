//
//  ThordTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 12/01/23.
//

import UIKit
///This is customer onboarding view controller
class ThirdTourViewController: UIViewController {

    //MARK: - IBOutlets Declaration
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
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    //MARK: - User defined methods
    
    /// function call to setup UI
    func updateUI()
    {
        setupLabel(label: lblTitle, font: fontBold, color: colorBlack, text: "Eat Well")
        setupLabel(label: lblDetails, font: fontRegular, color: colorGray, text: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun")
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
    /// function calls on tap of next button
    /// - Parameter sender: sender description
    @IBAction func btnNext(_ sender: Any) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.FourthTourViewController) as! FourthTourViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
