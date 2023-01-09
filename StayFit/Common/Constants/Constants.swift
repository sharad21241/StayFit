//
//  Constants.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import Foundation
import UIKit

public class Constants: NSObject {
    
    public static let shared = Constants()
    
    //MARK: - Device related information
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    var screenType: UIDevice.ScreenType {
           switch UIScreen.main.nativeBounds.height {
           case 1136:
               return .iPhones_5_5s_5c_SE
           case 1334:
               return .iPhones_6_6s_7_8
           case 1792:
               return .iPhones_6_6s_7_8
           case 1920, 2208:
               return .iPhones_6Plus_6sPlus_7Plus_8Plus
           case 2426:
               return .iPhone_11Pro
           case 2436:
               return .iPhones_X_XS
           case 2688:
               return .iPhone_XSMax_ProMax
           default:
               return .unknown
           }
    }
}
