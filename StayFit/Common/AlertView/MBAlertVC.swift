//
//  MBAlertVC.swift
//  StayFit
//
//  Created by Sharad Gangurde on 26/02/23.
//

import UIKit
protocol buttonDelegate {
    func okButtonTapped()
    func btnYesTapped()
}

public enum ButtonToShow {
    case Center
    case LeftRight
}

class MBAlertVC: BaseViewController {

    @IBOutlet weak var viewAlpha: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnStackView: UIStackView!
    @IBOutlet weak var btnLeft: MBButton!
    @IBOutlet weak var btnCenter: MBButton!
    @IBOutlet weak var btnRight: MBButton!
    
    var delegate: buttonDelegate?
    var whichButtonToShow: ButtonToShow = .Center
    var titleString: String?
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUI()
    }
    
    func updateUI()
    {
        Utils.shared.cornerRadiusTo(control: alertView)
        setupUILabel(label: lblTitle, lblText: titleString ?? "", size: ThemeConstants.shared.FontSizeM, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        setupUILabel(label: lblMessage, lblText: message ?? "", size: ThemeConstants.shared.FontSizeS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        //Hide all buttons
        btnCenter.isHidden = true
        btnRight.isHidden = true
        btnLeft.isHidden = true
        //decide which button to show on popup
        if self.whichButtonToShow == .Center {
            self.btnCenter.isHidden = false
        } else {
            self.btnLeft.isHidden = false
            self.btnRight.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnLeft, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeS, title: "No", radius: Float(self.btnLeft.frame.height)/2)
            self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnCenter, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeS, title: "Ok", radius: Float(self.btnCenter.frame.height)/2)
            self.setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: self.btnRight, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeS, title: "Yes", radius: Float(self.btnRight.frame.height)/2)
        })
    }
    
    @IBAction func btnCancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func btnOkTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        delegate?.okButtonTapped()
    }
    @IBAction func btnYesTapped(_ sender: UIButton) {
        delegate?.btnYesTapped()
    }
    
}
