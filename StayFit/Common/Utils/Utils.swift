//
//  Utils.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import Foundation
import UIKit

public class Utils: NSObject {
    public static let shared = Utils()
    
    
    /// function call to set cornerRadius to any view
    /// - Parameters:
    ///   - view: view description
    ///   - radius: radius description
    public func cornerRadiusTo(control: AnyObject, radius: Float = 10)
    {
        if let cntrl = control as? UIView
        {
            cntrl.layer.cornerRadius = CGFloat(radius)
            cntrl.clipsToBounds = true
            cntrl.layer.masksToBounds = true
        }
    }
    
    /// Function to create shadow to view
    ///
    /// - Parameter viw: view
    public func createShadowToView(viw : UIView, height: Float = 5)
    {
        viw.layer.masksToBounds = false
        viw.layer.shadowColor = UIColor.lightGray.cgColor
        viw.layer.shadowOpacity = 0.5
        viw.layer.shadowOffset = CGSize(width: 4, height: Int(height))
        viw.layer.shadowRadius = 5.0
    }
    /// function to get hex code to be replaced in svg
    ///
    /// - Parameter name: colour name (key)
    /// - Returns: string
    public func getColourCode(name : String) -> String
    {
        let path = readPlist(plistName: "Normal")
        
        //If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            let name = dic[name]! as! String
            
            return  name
        }
        return ""
    }
    
    //MARK:- Theme functions
    /// Function to get the specific font
    ///
    /// - Parameters:
    ///   - size: size
    ///   - fontName: fontname by default it is San Francisco regular
    /// - Returns: font to apply
    func getSpecificFonts(size:String, fontName:String = ThemeConstants.shared.FontFontello) -> UIFont {
        
        let path = getPathAccToDevice()
        
        ////If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            let fontName = dic[fontName]! as! String
            
            var fontSize =  dic[size]! as! CGFloat
            
            var incrementFactorForFontello:CGFloat = 0
            if let fontello = dic[ThemeConstants.shared.FontFontello] as? String
            {
                if fontello == fontName
                {
                    switch Constants.shared.screenType{
                    case .iPhones_5_5s_5c_SE:
                        incrementFactorForFontello = 0
                        
                    case .iPhones_6_6s_7_8:
                        incrementFactorForFontello = 2
                        
                    case .iPhones_6Plus_6sPlus_7Plus_8Plus:
                        incrementFactorForFontello = 4
                        
                    default: break
                    }
                    
                    fontSize = fontSize + incrementFactorForFontello
                }
            }
            
            return  UIFont(name: fontName, size: fontSize)!
        }
        return UIFont()
    }
    
    //MARK:- Print
    /// Function to check the current status mode for app is in debug or release mode and based on that print the dialogs
    ///
    /// - Parameter message: Message to be printed
    public func printLog(_ data: Any) {
        //Check if the code is running in which mode release/debug
            #if DEBUG
            print(data)
            #endif
    }
    
    //MARK:- Theme functions
    /// Function to get the specific font
    ///
    /// - Parameters:
    ///   - size: size
    ///   - fontName: fontname by default it is San Francisco regular
    /// - Returns: font to apply
    public func getSpecificFont(size:String, fontName:String = ThemeConstants.shared.Poppins) -> UIFont {
        
        let path = getPathAccToDevice()
        
        ////If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            let fontName = dic[fontName]! as! String
            
            var fontSize =  dic[size]! as! CGFloat
            
            var incrementFactorForFontello:CGFloat = 0
            if let fontello = dic[ThemeConstants.shared.FontFontello] as? String
            {
                if fontello == fontName
                {
                    switch Constants.shared.screenType{
                    case .iPhones_5_5s_5c_SE:
                        incrementFactorForFontello = 0
                        
                    case .iPhones_6_6s_7_8:
                        incrementFactorForFontello = 2
                        
                    case .iPhones_6Plus_6sPlus_7Plus_8Plus:
                        incrementFactorForFontello = 4
                        
                    default: break
                    }
                    
                    fontSize = fontSize + incrementFactorForFontello
                }
            }
            
            return  UIFont(name: fontName, size: fontSize)!
        }
        return UIFont()
    }
    
    
    /// Function to read the .plist file
    ///
    /// - Parameter plistName: file name
    /// - Returns: path of plist
    func readPlist(plistName : String) -> String {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist"){
            return path
        }
        
        return ""
        
    }
    
    
    /// Function to convert hex color into rgb color
    ///
    /// - Parameter name: name of key for the color from .plist file
    /// - Returns: UIColor object
    public func convertHexColor(name: String) -> UIColor
    {
        //#THEMECODE : Read plist according to customer type
        let path = readPlist(plistName: "Normal")
        
        //If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            let name = dic[name]! as! String
            
            return  UIColor(hex: name)
        }
        return UIColor()
    }
    
    
    /// Function to get the color from hex value
    ///
    /// - Parameter name: name
    /// - Returns: return color

    func getColorFromHexValue(name: String) -> UIColor
    {
        if name.count > 0
        {
            let updateName = name.replacingOccurrences(of: "#", with: "")
            return  UIColor(hex: updateName)
        }
        else
        {
            return convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        }
    }
    
    /// function call to add fontello icon to textfield
    /// - Parameters:
    ///   - textfield: textfield description
    ///   - icon: icon description
    func addIconToTextField(textfield: CustomTextField, icon: String)
    {
        let label = UILabel();
        label.font = getSpecificFonts(size: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.FontFontello)
        label.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)
        label.text = icon
        label.frame = CGRect(x: 10, y: 18, width: 25, height: 25)
        textfield.addSubview(label)
        let leftView = UIView.init(frame: CGRect(x:10, y:0, width:30, height:30))
        textfield.leftView = leftView;
        textfield.leftViewMode = UITextField.ViewMode.always
    }
    
    /// This is a function to do the basic set up of PageController
    func setUpForCustomPageController(viwCarousel:AnyObject, type: Int = 0, selectedColor: UIColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorYellowLight), normalColor: UIColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)) -> MBLCAnimatedPageControl
    {
        //Code to add customer Page controller
        let view: AnyObject?
        if type == 0 //Means for Carousel view
        {
            view = viwCarousel as! iCarousel
        }
        else
        {
            view = viwCarousel as! UICollectionView
        }
        
        
        var rect:CGRect!
        
        if #available(iOS 12.0, *) {
            rect = CGRect(x: 0, y: 0, width: viwCarousel.frame.size.width, height: 20)
        } else {
            // Fallback on earlier versions
            rect = CGRect(x: 0, y: 0, width: viwCarousel.bounds.size.width, height: 20)
        }
        
        let pageControl = MBLCAnimatedPageControl(frame: rect)
        
        if type == 0 //Means for Carousel view
        {
            pageControl.scrollStyle = .Carousel
        }
        else
        {
            pageControl.scrollStyle = .CollectionView
        }
        pageControl.indicatorDiameter = 4.0
        pageControl.indicatorMargin = 3.0
        pageControl.indicatorMultiple = 2.0
        pageControl.pageStyle = .LCScaleColorPageStyle
        pageControl.pageIndicatorColor = normalColor
        pageControl.currentPageIndicatorColor = selectedColor
        pageControl.sourceScrollView = view as! NSObject
        pageControl.prepareShow()
        return pageControl
    }
     
    
    /// Function to get the plist of specific device
    ///
    /// - Returns: path in string format
    func getPathAccToDevice()->String
    {
        var path = readPlist(plistName: "iPhone")
        
        switch Constants.shared.screenType{
        case .iPhones_5_5s_5c_SE:
            path = readPlist(plistName: "iPhone")
            
        case .iPhones_6_6s_7_8:
            path = readPlist(plistName: "iPhone6")
            
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            path = readPlist(plistName: "iPhone6Plus")
            
        case .iPhone_11Pro:
            path = readPlist(plistName: "iPhone11")
            
        case .iPhone_XR_11:
            path = readPlist(plistName: "iPhone11")
            
        case .iPhones_X_XS:
            path = readPlist(plistName: "iPhone11")
            
        case .iPhone_XSMax_ProMax:
            path = readPlist(plistName: "iPhone11")
            
        default: break
        }
        
        return path
    }
}



/// This enum is used for identifying button type
///
/// - BlueColorWhiteText: Blue color with White text
/// - BlueColorWhiteTextCorner : Same as BlueColorWhiteText but with corner radius
/// - ClearColorBlueText: Clear color blue text
/// - ClearColorBlueTextCornerBorder: With clear color, Blue text Blue border
/// - BlueColorWhiteTextCornerSmall : Same as BlueColorWhiteText but with corner radius - Small Buttons
/// - GrayColorWhiteTextCorner : Gray color white text with corner
/// - RedColorWhiteTextCorner: Red color white text
/// - GreenColorWhiteTextRounded : Green color white text
/// - GrayColorBlueTextRounded : Gray color white text
/// - ClearColorText " Clear color text
/// - GreenColorWhiteTextCorner : Green color white text corner
/// - WhiteColorGrayTextCorner : white color gray text with corner
public enum ButtonTypeFormat {
    
    case BlueColorWhiteText
    case BlueColorWhiteTextCorner
    case ClearColorBlueText
    case ClearColorBlueTextSmall
    case ClearColorBlueTextCornerBlueBorder
    case BlueColorMultilineWhiteText
    case BlueColorWhiteTextCornerSmall
    case BlueColorWhiteTextCornerSmallImage
    case GrayColorWhiteTextCorner
    case RedColorWhiteTextCorner
    case GreenColorWhiteTextRounded
    case GrayColorBlueTextRounded
    case GrayColorBlueTextCorner
    case ClearColorText
    case GreenColorWhiteTextCorner
    case WhiteColorGrayTextCorner
    case BlueColorWhiteTextCornerRadiusSmallImage
    case BlueColorWhiteTextSmallImage
    case WhiteColorBlueText
    case ClearColorWhiteTextWithBorder
}

// This enum is used for identifying button State
///
/// - Active: Active state
/// - Inactive: Inactive state
public enum ButtonState {
    case Active
    case Inactive
}

/// This class is used for custom Ui button
public class MBButton: UIButton {
    //MARK: - IBAction methods
    /// Function to set the button according to its type
    ///
    /// - Parameter buttonType: type of button
    /// - Parameter state: state of button
    /// - Parameter setContentEdgeInset: set content edge
    public func setButton(buttonType : ButtonTypeFormat , state : UIControl.State = .normal, setContentEdgeInset: Bool = true)
    {
        //Font Size
        self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS,fontName: ThemeConstants.shared.FontBold)
        if setContentEdgeInset == true
        {
            self.contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 0, bottom: 15, right: 0)
        }
        
        switch buttonType {
        case .BlueColorWhiteText:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            break
        case .BlueColorWhiteTextCorner:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.clear.cgColor
            self.clipsToBounds = true
            break
        case .ClearColorBlueText:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS,fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.backgroundColor = .clear
            self.contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 0, bottom: 15, right: 0)
            break
        case .ClearColorBlueTextSmall:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS,fontName: ThemeConstants.shared.FontRegular)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.backgroundColor = .clear
            self.contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 0, bottom: 15, right: 0)
            break
        case .ClearColorBlueTextCornerBlueBorder:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.backgroundColor = .clear
            self.clipsToBounds = true
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 1.0
            self.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue).cgColor
            break
        case .BlueColorMultilineWhiteText :
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXXS,fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.layer.cornerRadius = 20.0
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.clear.cgColor
            self.clipsToBounds = true
            self.titleLabel?.lineBreakMode = .byWordWrapping
            // you probably want to center it
            self.titleLabel?.textAlignment = .center // if you want to
            self.centerTextAndImage(spacing: 3)
            break
        case .BlueColorWhiteTextCornerSmall:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXS,fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
            self.layer.cornerRadius = self.frame.height/2
            break
        case .BlueColorWhiteTextCornerSmallImage:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXS,fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.layer.cornerRadius = self.frame.height/2
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.clear.cgColor
            self.centerTextAndImage(spacing: 5)
            self.clipsToBounds = true
            self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
            break
        case .GrayColorWhiteTextCorner:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXXXS)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGray)
            self.layer.cornerRadius = self.frame.height/2
            break
        case .RedColorWhiteTextCorner:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorRed)
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.clear.cgColor
            self.clipsToBounds = true
        case .GreenColorWhiteTextRounded:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXS)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.setTitleColor(Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite), for: .normal)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGreen)
            self.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
            self.layer.cornerRadius = self.frame.height/2
            break
        case .GrayColorBlueTextCorner:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.clear.cgColor
            self.clipsToBounds = true
            break
        case .GrayColorBlueTextRounded:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXS)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.setTitleColor(Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue), for: .normal)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightGray)
            self.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
            self.layer.cornerRadius = self.frame.height/2
        case .GreenColorWhiteTextCorner:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGreen)
            self.clipsToBounds = true
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 1.0
            self.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorGreen).cgColor
            break
        case .ClearColorText:
            self.backgroundColor = UIColor.clear
            break
        case .WhiteColorGrayTextCorner:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorPlaceHolderGray)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.clipsToBounds = true
            self.layer.cornerRadius = 10.0
            self.layer.borderWidth = 1.0
            self.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite).cgColor
        case .BlueColorWhiteTextCornerRadiusSmallImage:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXS,fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.layer.cornerRadius = 4.0
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.clear.cgColor
            self.centerTextAndImage(spacing: 8)
            self.clipsToBounds = true
            self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
            break
        case .BlueColorWhiteTextSmallImage:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXS,fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.centerTextAndImage(spacing: 5)
            self.clipsToBounds = true
            self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
            break
        case .WhiteColorBlueText:
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue)
            self.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.setTitleColor(Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlue), for: .normal)
            break
        case .ClearColorWhiteTextWithBorder:
            self.titleLabel?.font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXXXXXL, fontName: ThemeConstants.shared.FontBold)
            self.tintColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
            self.backgroundColor = UIColor.clear
            self.clipsToBounds = true
            self.layer.cornerRadius = 10.0
            self.layer.borderWidth = 1.0
            self.layer.borderColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlack).cgColor
            break
        }
        
    }
    
    /// This function is used for behaviour of button depending on state
    ///
    /// - Parameter buttonState: Active or InActive
    public func setStateToButton(buttonState : ButtonState)
    {
        if buttonState == ButtonState.Active
        {
            self.alpha = 1.0
            self.isUserInteractionEnabled = true
        }
        else if buttonState == ButtonState.Inactive
        {
            self.alpha = 0.6
            self.isUserInteractionEnabled = false
            
        }
    }
    
    /// This function is used for behaviour of button depending on state
    ///
    /// - Parameter buttonState: Active or InActive
    public func setStateToButton(buttonState : ButtonState, color: UIColor)
    {
        if buttonState == ButtonState.Active
        {
            self.alpha = 1.0
            self.backgroundColor = color
            self.isUserInteractionEnabled = true
        }
        else if buttonState == ButtonState.Inactive
        {
            self.alpha = 1.0
            self.backgroundColor = color
            self.isUserInteractionEnabled = false
            
        }
    }
}

// MARK: - Gradient
extension CAGradientLayer {
    enum Point {
        case topLeft
        case centerLeft
        case bottomLeft
        case topCenter
        case center
        case bottomCenter
        case topRight
        case centerRight
        case bottomRight
        var point: CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: 0, y: 0)
            case .centerLeft:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeft:
                return CGPoint(x: 0, y: 1.0)
            case .topCenter:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottomCenter:
                return CGPoint(x: 0.5, y: 1.0)
            case .topRight:
                return CGPoint(x: 1.0, y: 0.0)
            case .centerRight:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomRight:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    convenience init(start: Point, end: Point, colors: [CGColor], type: CAGradientLayerType) {
        self.init()
        self.startPoint = start.point
        self.endPoint = end.point
        self.colors = colors
        self.locations = (0..<colors.count).map(NSNumber.init)
        self.type = type
    }
}
