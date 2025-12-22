//
//  TextFieldCell.swift
//  StayFit
//
//  Created by Sharad Gangurde on 18/01/23.
//

import UIKit
//This class is used for commont textfield
class TextFieldCell: UITableViewCell {

    //MARK: - IBOutles
    @IBOutlet weak var txtField: CustomTextField!
    
    //MARK: - Variable Declaration
    var entity:CommonTextFieldEntity = CommonTextFieldEntity() {
        didSet {
            setupTextfield()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    /// function call to setup textfield
    func setupTextfield()
    {
        let font = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeM, fontName: ThemeConstants.shared.Poppins)
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
    }
}
