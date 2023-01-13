//
//  Storyboard.swift
//  StayFit
//
//  Created by Sharad Gangurde on 09/01/23.
//

import Foundation

public class Storyboard : NSObject {
    
    public static let shared = Storyboard()
    
    //MARK: - Storyboards
    let Register = "Register"
    
    
    
}


public class VCIdentifier: NSObject {
    public static let shared = VCIdentifier()
    
    //MARK: - Controllers
    
    let RegisterBaseViewController = "RegisterBaseViewController"
    let OnboardingViewController = "OnboardingViewController"
    let FirstTourViewController = "FirstTourViewController"
    let SecondTourViewController = "SecondTourViewController"
    let ThirdTourViewController = "ThirdTourViewController"
    let FourthTourViewController = "FourthTourViewController"
    
}
