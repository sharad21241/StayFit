//
//  PersonalDetailsVC.swift
//  StayFit
//
//  Created by Sharad Gangurde on 18/01/23.
//

import UIKit
///This class is used to fill personal details
class PersonalDetailsVC: BaseViewController {

    //MARK: - IBOutlet Declarations
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgTopViw: UIImageView!
    @IBOutlet weak var tblViw: UITableView!
    @IBOutlet weak var tblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnNext: MBButton!
    
    //MARK: - Variable Declarations
    var arrDetails = [CommonTextFieldEntity]()
    var rowGender = -1
    var rowDOB = -1
    var rowWeight = -1
    var rowHeight = -1
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    //MARK: - User Defined methods
    /// function call to update UI
    func updateUI()
    {
        let fontRegular = ThemeConstants.shared.Poppins
        let fontBold = ThemeConstants.shared.PoppinsSemiBold
        let fontSizeM = ThemeConstants.shared.FontSizeM
        let fontSizeXL = ThemeConstants.shared.FontSizeXL
        
        let colorBlack = ThemeConstants.shared.FontColorBlack
        let colorGray = ThemeConstants.shared.FontColorGray
        
        //Setup Labels
        //1 - Title Label
        setupUILabel(label: lblTitle, lblText: "Let's complete your profile", size: fontSizeXL, name: fontBold, color: colorBlack)
        //2 - Subtitle Label
        setupUILabel(label: lblSubTitle, lblText: "It will help us to know more about you!", size: fontSizeM, name: fontRegular, color: colorGray)
        
        //Setup Button
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        
        self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnNext, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXXXL, title: "Next", isAttributed: true, icon: MBFontello.shared.icon_right)
    
        //Setup table data
        self.setupTableViewData()
        
    }
    
    /// function call to set tblview data
    func setupTableViewData()
    {
       arrDetails = [CommonTextFieldEntity]()
        
        //Row Gender
        var objEntity = CommonTextFieldEntity()
        rowGender = arrDetails.count
        objEntity.placeholder = "Choose Gender"
        objEntity.rightIcon = MBFontello.shared.ic_bene_sync
        objEntity.errorMessage = "Please select gender"
        arrDetails.append(objEntity)
        
        //Row DOB
        objEntity = CommonTextFieldEntity()
        rowDOB = arrDetails.count
        objEntity.placeholder = "Date of Birth"
        objEntity.rightIcon = MBFontello.shared.icon_calendar
        objEntity.errorMessage = "Please enter Date of Birth"
        arrDetails.append(objEntity)
        
        //Row Weight
        objEntity = CommonTextFieldEntity()
        rowWeight = arrDetails.count
        objEntity.placeholder = "Your Weight"
        objEntity.rightIcon = MBFontello.shared.ic_weight
        objEntity.errorMessage = "Please enter your weight"
        arrDetails.append(objEntity)
        
        //Row Height
        objEntity = CommonTextFieldEntity()
        rowHeight = arrDetails.count
        objEntity.placeholder = "Your Height"
        objEntity.rightIcon = MBFontello.shared.ic_height
        objEntity.errorMessage = "Please enter your height"
        arrDetails.append(objEntity)
        
        //Configure Table
        self.configureTable()
    }
    
    /// Configure tableview
    func configureTable()
    {
        tblViw.register(UINib(nibName: VCIdentifier.shared.textFieldCell, bundle: nil), forCellReuseIdentifier: VCIdentifier.shared.textFieldCell)
        tblViw.register(UINib(nibName: VCIdentifier.shared.TextFieldRightViewCell, bundle: nil), forCellReuseIdentifier: VCIdentifier.shared.TextFieldRightViewCell)

        tblViw.bounces = false
        tblViw.separatorStyle = .none
        
        tblViw.delegate = self
        tblViw.dataSource = self
        
        tblViw.reloadData()
    }
    //MARK: - IBAction methods
    /// function call to validate and navigate to next screen
    /// - Parameter sender: UIButton
    @IBAction func btnNext(_ sender: UIButton) {
        let sb = UIStoryboard(name: Storyboard.shared.Register, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCIdentifier.shared.CardsViewController) as! CardsViewController
        //self.navigationController?.pushViewController(vc, animated: true)
        vc.isFormPrelogin = true
        Constants.shared.appDel.rootNavigation.pushViewController(vc, animated: true)
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource
extension PersonalDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == rowDOB || indexPath.row == rowGender {
            let cell = tableView.dequeueReusableCell(withIdentifier: VCIdentifier.shared.textFieldCell) as! TextFieldCell
            cell.entity = arrDetails[indexPath.row]
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: VCIdentifier.shared.TextFieldRightViewCell) as! TextFieldRightViewCell
            let iIndex = indexPath.row
            cell.entity = arrDetails[iIndex]
            cell.lblView.text = iIndex == rowWeight ? "KG" : "CM"
            cell.selectionStyle = .none
            return cell
        }
        
    }
}
