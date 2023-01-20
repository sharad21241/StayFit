//
//  FourthTourViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 12/01/23.
//

import UIKit
///This is customer onboarding view controller
class FourthTourViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    //MARK: - Variable Declaration
    let fontBold = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeL, fontName: ThemeConstants.shared.FontBold)
    let fontRegular = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.FontRegular)
    let colorBlack = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack)
    let colorGray = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    
    func updateUI()
    {
        setupLabel(label: lblTitle, font: fontBold, color: colorBlack, text: "Improve Sleep Quality")
        setupLabel(label: lblDetails, font: fontRegular, color: colorGray, text: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning")
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
    @IBAction func btnNext(_ sender: Any) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.RegisterBaseViewController) as! RegisterBaseViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
