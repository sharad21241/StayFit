//
//  BaseViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/01/23.
//

import UIKit
//enum to place the
public enum placeAt {
    case Right
    case left
}

//enum of navigationBar right buttons
public enum RightButtonType {
    case noRightButton
    case rightButtons
    case MoreButton
}

//enum of navigationBar right buttons
public enum BackButtonType {
    case leftArrowButton
    case crossButton
}

///this is a base class
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// function call to customize textfield
    /// - Parameters:
    ///   - textField: textField description
    ///   - placeholder: placeholder description
    ///   - fontSize: fontSize description
    ///   - fontName: fontName description
    ///   - icon: icon description
    func setupTextField(textField: CustomTextField, placeholder: String, fontSize: String, fontName: String, icon: String = MBFontello.shared.icon_user) {
        textField.placeholder = placeholder
        textField.font = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.floatPlaceholderFont = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        textField.dtLayer.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightTextFieldBG).cgColor
        textField.dtborderStyle = .rounded
        Utils.shared.addIconToTextField(textfield: textField, icon: icon)
        textField.dtLayer.borderWidth = 0
        Utils.shared.cornerRadiusTo(control: textField, radius: 15)
    }
    
    /// function call to customize uibutton
    /// - Parameters:
    ///   - firstColor: firstColor description
    ///   - SecondColor: SecondColor description
    ///   - btn: btn description
    ///   - btnType: btnType description
    ///   - fontName: fontName description
    ///   - fontSize: fontSize description
    ///   - title: title description
    ///   - isAttributed: isAttributed description
    ///   - icon: icon description
    func setupButtonWithGradient(firstColor: UIColor, secondColor: UIColor, btn: MBButton, btnType: ButtonTypeFormat, fontName: String, fontSize: String, title: String, isAttributed: Bool = false, icon: String = "", borderWidth: CGFloat = 0, isIconFirst: Bool = false, radius: Float = 30)
    {
        let gradient = CAGradientLayer(start: .centerLeft, end: .centerRight, colors: [firstColor.cgColor, secondColor.cgColor], type: .axial)
        let font = Utils.shared.getSpecificFont(size: fontSize, fontName: fontName)
        
        gradient.frame = btn.layer.bounds
        btn.layer.addSublayer(gradient)
        
        btn.layer.borderWidth = borderWidth
        btn.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        btn.titleLabel?.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        btn.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond).cgColor
        Utils.shared.cornerRadiusTo(control: btn, radius: radius)
        
        if isAttributed {
            let fontello = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXL, fontName: ThemeConstants.shared.FontFontello)
            
            let attributedText = NSMutableAttributedString()
            if isIconFirst {
                attributedText.append(attributedString(icon, font: fontello))
                attributedText.append(attributedString(" ", font: font)) //Add Space between text & icon
                attributedText.append(attributedString(title, font: font))
            }
            else {
                attributedText.append(attributedString(title, font: font))
                attributedText.append(attributedString(" ", font: font)) //Add Space between text & icon
                attributedText.append(attributedString(icon, font: fontello))
            }
            
            btn.setAttributedTitle(attributedText, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 30, right: 0)
        }
        else {
            btn.setTitle(title, for: .normal)
            btn.titleLabel?.font = font
        }
    }
    
    /// function call to customize UI label
    /// - Parameters:
    ///   - label: label description
    ///   - lblText: lblText description
    ///   - size: size description
    ///   - name: name description
    ///   - color: color description
    func setupUILabel(label: UILabel, lblText: String, size: String, name: String, color: String) {
        label.font = Utils.shared.getSpecificFont(size: size, fontName: name)
        label.text = lblText
        label.textColor = Utils.shared.convertHexColor(name: color)
    }
    
    /// Function to get attributed string
    ///
    /// - Parameters:
    ///   - string: String for adding attributes
    ///   - font: Font for the string
    /// - Returns: Attributed string with custom font
    func attributedString(_ string: String, font: UIFont) -> NSAttributedString {
        
        //Set attributed text to label description
        let strAttributedText = NSMutableAttributedString(string: string)
        
        //Add attributes
        strAttributedText.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: string.count))
        let paragraphStyle = NSMutableParagraphStyle()  //Create a paragraph style object
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        strAttributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSRange(location: 0, length: strAttributedText.length))
        
        return strAttributedText
    }
    
    func setupNavigationBar(title: String, backButtonType: BackButtonType, rightButtonType: RightButtonType)
    {
       // let rightButton = UIBarButtonItem(image: UIImage(named: "right-icon"), style: .plain, target: self, action: #selector(rightButtonTapped))
        DispatchQueue.main.async {
            //Left - Back button
            let colorBlack = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack)
            let btnBack = UIButton(frame: CGRect(x: 0, y: 10, width: 35, height: 35))
            btnBack.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
            btnBack.titleLabel?.textAlignment = .left
            btnBack.clipsToBounds = true
            Utils.shared.cornerRadiusTo(control: btnBack)
            btnBack.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
            btnBack.setTitleColor(colorBlack, for: .normal)
            btnBack.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXL, fontName: ThemeConstants.shared.FontFontello)
            btnBack.setTitle(MBFontello.shared.icon_left, for: .normal)
            //Right - Cross button
            let btnCross = UIButton(frame: CGRect(x: 0, y: 10, width: 35, height: 35))
            btnCross.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
            btnCross.titleLabel?.textAlignment = .left
            btnCross.clipsToBounds = true
            Utils.shared.cornerRadiusTo(control: btnCross)
            btnCross.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
            btnCross.setTitleColor(colorBlack, for: .normal)
            btnCross.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXL, fontName: ThemeConstants.shared.FontFontello)
            btnCross.setTitle(MBFontello.shared.ic_cancel, for: .normal)
            //Right - More button
            let btnMore = UIButton(frame: CGRect(x: -15, y: 0, width: 35, height: 35))
            btnMore.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
            btnMore.titleLabel?.textAlignment = .right
            btnMore.clipsToBounds = true
            Utils.shared.cornerRadiusTo(control: btnMore)
            btnMore.addTarget(self, action: #selector(self.moreButtonTapped), for: .touchUpInside)
            btnMore.setTitleColor(colorBlack, for: .normal)
            btnMore.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXL, fontName: ThemeConstants.shared.FontFontello)
            btnMore.setTitle(MBFontello.shared.icon_twodot, for: .normal)
            
            //Set right button
            let btnShare = UIButton(frame: CGRect(x: Constants.shared.uiScreen.bounds.width - 40, y: 0, width: 35, height: 35))
            btnShare.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
            btnShare.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeS, fontName: ThemeConstants.shared.FontFontello)
            btnShare.titleLabel?.textAlignment = .right
            btnShare.setTitleColor(colorBlack, for: .normal)
            btnShare.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXL, fontName: ThemeConstants.shared.FontFontello)
            btnShare.setTitle(MBFontello.shared.ic_share, for: .normal)
            btnShare.setTitleColor(Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray), for: .normal)
            btnShare.addTarget(self, action: #selector(self.shareButtonTapped), for: .touchUpInside)
            btnShare.clipsToBounds = true
            Utils.shared.cornerRadiusTo(control: btnShare)
            //Screen Title
            let iWidth = self.view.frame.width * 0.50
            let viw = UIView(frame: CGRect(x: 0, y: 10, width: iWidth, height: 44))
            // else we need to show title and back button
            //initialise the title label
            let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: iWidth, height: viw.frame.size.height))
            lblTitle.text = title
            lblTitle.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXL, fontName: ThemeConstants.shared.PoppinsSemiBold)
            lblTitle.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack)
            lblTitle.textAlignment = .center
            lblTitle.clipsToBounds = true
            lblTitle.sizeToFit()
            let iframe = CGRect(x: lblTitle.frame.origin.x, y: lblTitle.frame.origin.y, width: iWidth, height: viw.frame.size.height)
            lblTitle.frame = iframe
            viw.addSubview(lblTitle)
            //Set the title view
            self.navigationItem.titleView = viw
            
            //Backbutton types
            switch backButtonType {
            case .leftArrowButton:
                do {
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnBack)
                }
            case .crossButton:
                do {
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnCross)
                }
            }
            //Right button types
            switch rightButtonType {
            case .noRightButton:
                //No buttons at Right
                break
            case .MoreButton:
                do {
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnMore)
                }
            case .rightButtons :
                do {
                    var arrItems = [UIBarButtonItem]()
                    arrItems.append(UIBarButtonItem(customView: btnMore))
                    arrItems.append(UIBarButtonItem(customView: btnShare))
                    self.navigationItem.rightBarButtonItems = arrItems
                }
            }
        }
    }
    
    @objc func backButtonTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func shareButtonTapped()
    {
        print("Share button Tapped")
    }
    
    @objc func moreButtonTapped()
    {
        print("More button Tapped")
    }
}
