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
    let Login = "Login"
    let Dashboard = "Dashboard"
    
    
    
}


public class VCIdentifier: NSObject {
    public static let shared = VCIdentifier()
    
    //MARK: - Controllers & Xib's
    
    let RegisterBaseViewController = "RegisterBaseViewController"
    let OnboardingViewController = "OnboardingViewController"
    let FirstTourViewController = "FirstTourViewController"
    let SecondTourViewController = "SecondTourViewController"
    let ThirdTourViewController = "ThirdTourViewController"
    let FourthTourViewController = "FourthTourViewController"
    let LoginViewController = "LoginViewController"
    let PersonalDetailsVC = "PersonalDetailsVC"
    let CardsViewController = "CardsViewController"
    let WelcomeUserVC = "WelcomeUserVC"
    let DashboardViewController = "DashboardViewController"
    let ProfileViewController = "ProfileViewController"
    
    //MARK: -  TableView Cells
    let textFieldCell = "TextFieldCell"
    let TextFieldRightViewCell = "TextFieldRightViewCell"
    let CarouselView = "CarouselView"
    
}
