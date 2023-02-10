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
    
    //MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
