//
//  TextFieldRightViewCell.swift
//  StayFit
//
//  Created by Sharad Gangurde on 07/02/23.
//

import UIKit

class TextFieldRightViewCell: UITableViewCell {

    @IBOutlet weak var txtField: CustomTextField!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var lblView: UILabel!
    
    //MARK: - Variable Declaration
    var entity:CommonTextFieldEntity = CommonTextFieldEntity() {
        didSet {
            setupTextfield()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTextfield()
    {
        let font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        //Gradient purple
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorPurpleLinear)
        let secondColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorPurple)
        
        txtField.font = font
        txtField.floatPlaceholderFont = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
        txtField.dtLayer.backgroundColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorLightTextFieldBG).cgColor
        txtField.errorMessage = entity.errorMessage ?? ""
        txtField.placeholder = entity.placeholder
        txtField.text = entity.defaultValue
        txtField.dtborderStyle = .rounded
        txtField.dtLayer.borderWidth = 0
        Utils.shared.addIconToTextField(textfield: txtField, icon: entity.rightIcon ?? "")
        Utils.shared.cornerRadiusTo(control: txtField, radius: 15)
        lblView.font = font
        lblView.textColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        //Gradient view
        let gradient = Utils.shared.setupGradientText(firstColor: firstColor, secondColor: secondColor, control: rightView)
        rightView.layer.addSublayer(gradient)
        Utils.shared.cornerRadiusTo(control: rightView, radius: 15)
    }
}
