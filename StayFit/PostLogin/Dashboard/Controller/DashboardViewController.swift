//
//  DashboardViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 07/02/23.
//

import UIKit
//This is Dashboard class
class DashboardViewController: BaseViewController {
    //MARK: - IBOutlet Declaration
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnNotification: UIButton!
    //MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    /// function call to setup ui
    func setupUI()
    {
        setupUILabel(label: lblWelcome, lblText: "Welcome Back,", size: ThemeConstants.shared.FontSizeS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        
        setupUILabel(label: lblName, lblText: "Stefani Wong", size: ThemeConstants.shared.FontSizeXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        //Gradient colors
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
        let secondColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        let gradient = Utils.shared.setupGradientText(firstColor: firstColor, secondColor: secondColor, start: .topCenter, end: .bottomCenter , control: btnNotification)
        btnNotification.layer.addSublayer(gradient)
        //Button properties
        btnNotification.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.FontFontello)
        btnNotification.setTitle(MBFontello.shared.ic_notification, for: .normal)
        btnNotification.setTitleColor(Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray), for: .normal)
        Utils.shared.cornerRadiusTo(control: btnNotification)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(nameTapped(_:)))
        lblName.isUserInteractionEnabled = true
        lblName.addGestureRecognizer(tap)
        
    }
    
    //MARK: - IBACtion methods
    /// function calls on tap of user name
    /// - Parameter sender: UITapGestureRecognizer
    @objc func nameTapped(_ sender: UITapGestureRecognizer? = nil)
    {
        print("Name Tapped")
        let storyboard = UIStoryboard(name: Storyboard.shared.Dashboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.ProfileViewController) as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    /// notification button tap action
    /// - Parameter sender: UIButton
    @IBAction func btnNotificationTapped(_ sender: UIButton) {
        print("Notification icon tapped")
    }
}
