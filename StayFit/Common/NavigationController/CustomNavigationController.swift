//
//  CustomNavigationController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 11/01/23.
//

import Foundation
import UIKit
/// This class is custom navigation viewcontroller class which will be used throughout application
public class CustomNavigationViewController: UINavigationController {

    //MARK:- Variables
    var viwBottomBorder = UIView()
    
    //MARK:- View life cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        viewController.viewWillAppear(animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        viewController.viewDidAppear(animated)
    }
}

