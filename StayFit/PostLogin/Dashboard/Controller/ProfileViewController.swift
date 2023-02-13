//
//  ProfileViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 11/02/23.
//

import UIKit
//this is profile class
class ProfileViewController: BaseViewController {
    //MARK: - IBOutlet Declaration
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblProgName: UILabel!
    @IBOutlet weak var btnEdit: MBButton!
    @IBOutlet weak var stackViwDetails: UIStackView!
    @IBOutlet weak var viwHeight: UIView!
    @IBOutlet weak var viwWeight: UIView!
    @IBOutlet weak var viwAge: UIView!
    @IBOutlet weak var lblValHeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblValWeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblAgeVal: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    //MARK: - Variable Declaration
    var program = ""
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.setupNavigationBar(title: "Profile", backButtonType: .leftArrowButton, rightButtonType: .MoreButton)
        //get a selected program
        program = Constants.shared.program + " " + "Program"
        self.setProgram()
    }
    
    /// function call to update UI
    func setupUI()
    {
        setupUILabel(label: lblName, lblText: "Stefani Wong", size: ThemeConstants.shared.FontSizeXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        
        Utils.shared.cornerRadiusTo(control: imgUser, radius: Float(imgUser.frame.size.height/2))
        imgUser.image = UIImage(named: "user")
        
        Utils.shared.cornerRadiusTo(control: viwHeight)
        Utils.shared.cornerRadiusTo(control: viwWeight)
        Utils.shared.cornerRadiusTo(control: viwAge)
        
        viwHeight.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        viwWeight.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        viwAge.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        
        Utils.shared.createShadowToView(viw: viwHeight, height: 3)
        Utils.shared.createShadowToView(viw: viwWeight, height: 3)
        Utils.shared.createShadowToView(viw: viwAge, height: 3)
        
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        
        setupUILabel(label: lblValHeight, lblText: "180cm", size: ThemeConstants.shared.FontSizeXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlueLinear)
        setupUILabel(label: lblValWeight, lblText: "65kg", size: ThemeConstants.shared.FontSizeXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlueLinear)
        setupUILabel(label: lblAgeVal, lblText: "22yo", size: ThemeConstants.shared.FontSizeXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlueLinear)
        
        setupUILabel(label: lblHeight, lblText: "Height", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        setupUILabel(label: lblWeight, lblText: "Weight", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        setupUILabel(label: lblAge, lblText: "Age", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
        
        setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnEdit, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeS, title: "Edit", radius: Float(btnEdit.frame.size.height)/2)
    }
    
    /// function call to set program
    func setProgram()
    {
        setupUILabel(label: lblProgName, lblText: program, size: ThemeConstants.shared.FontSizeS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorGray)
    }
    /// function call for edit button action
    /// - Parameter sender: UIButton
    @IBAction func btnEditTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.CardsViewController) as! CardsViewController
        vc.isFormPrelogin = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
