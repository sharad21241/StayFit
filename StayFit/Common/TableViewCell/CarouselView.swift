//
//  CarouselView.swift
//  StayFit
//
//  Created by Sharad Gangurde on 20/01/23.
//

import UIKit
///this class is use for carousel
class CarouselView: UIView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblImageTitle: UILabel!
    @IBOutlet weak var lblImageSubtitle: UILabel!
    @IBOutlet weak var viwDivider: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }
    //Update labels
    func updateUI()
    {
        let fontRegular = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.Poppins)
        let fontBold = Utils.shared.getSpecificFont(size: ThemeConstants.shared.FontSizeXS, fontName: ThemeConstants.shared.PoppinsSemiBold)
        let colorWhite = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorWhite)
        
        lblImageTitle.font = fontBold
        lblImageSubtitle.font = fontRegular
        lblImageTitle.textColor = colorWhite
        lblImageSubtitle.textColor = colorWhite
    }
}
