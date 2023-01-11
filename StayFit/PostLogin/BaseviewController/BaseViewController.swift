//
//  BaseViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 10/01/23.
//

import UIKit

class BaseViewController: UIViewController {

    var navigationBar: UINavigationBar!
    var customNavigationItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }
    
    func updateContent()
    {
        self.prepareNavigatioBar()
    }
    
    func prepareNavigatioBar()
    {
        // Create a navigation bar with the width of the view, and the standard height of 44.
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        
        // Initialize the UINavigationItem class. The name is a bit confusing, because as you'll see -
        // we add multiple items to the one 'UINavigationItem.'
        customNavigationItem = UINavigationItem()
        customNavigationItem.title = ""
        
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backBtnTapped))
        customNavigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(rightBtnTapped))
        customNavigationItem.rightBarButtonItem = rightBarButton
        
        // Add the items to the navigation bar.
        navigationBar.items = [customNavigationItem]
        // Add the navigation bar to the view.
        self.view.addSubview(navigationBar)
    }
    
    @objc func backBtnTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBtnTapped()
    {
        
    }
}
