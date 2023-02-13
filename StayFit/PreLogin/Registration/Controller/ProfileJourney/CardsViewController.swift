//
//  CardsViewController.swift
//  StayFit
//
//  Created by Sharad Gangurde on 18/01/23.
//

import UIKit

///This class is used to store the carousel cards data
class CarouselData: NSObject {
    var img: String?
    var title: String?
    var subTitle: String?
}
///This class is used to show carousel card view
class CardsViewController: BaseViewController {
    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var viewCarousel: iCarousel!
    @IBOutlet weak var btnConfirm: MBButton!
    
    //MARK: - Variable Declaration
    var arrDetails = [CarouselData]()
    var pageControl: MBLCAnimatedPageControl!
    var iSelectedCard = -1
    
    var isFormPrelogin = false
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        self.updateUI()
        self.setupCarouselData()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent:parent)
        if parent == nil {
            // The back button was pressed or interactive gesture used
            viewCarousel.scrollToItem(at: 0, animated: false)
        }
    }
    //MARK: - User defined methods
    /// function call to update UI
    func updateUI()
    {
        //Setup UILabels
        setupUILabel(label: lblTitle, lblText: "What is your goal ?", size: ThemeConstants.shared.FontSizeXXXL, name: ThemeConstants.shared.PoppinsSemiBold, color: ThemeConstants.shared.FontColorBlack)
        setupUILabel(label: lblSubTitle, lblText: "It will help us to choose a best program for you", size: ThemeConstants.shared.FontSizeXS, name: ThemeConstants.shared.Poppins, color: ThemeConstants.shared.FontColorBlack)
        
        let firstColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinearSecond)
        let lastColor = Utils.shared.convertHexColor(name: ThemeConstants.shared.FontColorBlueLinear)
        
        //Setup buttons
        setupButtonWithGradient(firstColor: firstColor, secondColor: lastColor, btn: btnConfirm, btnType: .ClearColorWhiteTextWithBorder, fontName: ThemeConstants.shared.PoppinsSemiBold, fontSize: ThemeConstants.shared.FontSizeXL, title: "Confirm")
        btnConfirm.addTarget(self, action: #selector(btnNextTapped), for: .touchUpInside)
    }
    
    /// function call to setup the cards to show
    func setupCarouselData()
    {
        var objEntity = CarouselData()
        objEntity.img = "CardGoals1"
        objEntity.title = "Improve Shape"
        objEntity.subTitle = "I have a low amount of body fat and need / want to build more muscle"
        arrDetails.append(objEntity)
        
        objEntity = CarouselData()
        objEntity.img = "CardGoals2"
        objEntity.title = "Lean & Tone"
        objEntity.subTitle = "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way"
        arrDetails.append(objEntity)
        
        objEntity = CarouselData()
        objEntity.img = "CardGoals3"
        objEntity.title = "Lose a Fat"
        objEntity.subTitle = "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass"
        arrDetails.append(objEntity)
        
        //Setup page control
        pageControl = Utils.shared.setUpForCustomPageController(viwCarousel: viewCarousel)
        viewCarousel.addSubview(pageControl)
        viewCarousel.type = .custom
        viewCarousel.delegate = self
        viewCarousel.dataSource = self
        viewCarousel.isUserInteractionEnabled = true
        pageControl.isHidden = true
        pageControl.numberOfPages = arrDetails.count
        viewCarousel.scrollToItem(at: iSelectedCard, animated: true)
    }
    
    /// function call on next button tap
    @objc func btnNextTapped()
    {
        if isFormPrelogin {
            let storyboard = UIStoryboard(name: Storyboard.shared.Login, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifier.shared.LoginViewController) as! LoginViewController
            Constants.shared.appDel.rootNavigation.pushViewController(vc, animated: true)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
        
        //self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - iCarouselDelegate, iCarouselDataSource
extension CardsViewController: iCarouselDelegate, iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return arrDetails.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let data = arrDetails[index]
        let viw = Bundle.main.loadNibNamed(VCIdentifier.shared.CarouselView, owner: self, options: nil)![0] as! CarouselView
        viw.frame.size = CGSize(width: viewCarousel.bounds.size.width, height: viewCarousel.bounds.size.height)
        viw.imgView.image = UIImage(named: data.img ?? "")
        viw.lblImageTitle.text = data.title
        viw.lblImageSubtitle.text = data.subTitle
        return viw
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel){
        pageControl.changePage(carousel.currentItemIndex)
        let data = arrDetails[carousel.currentItemIndex]
        Constants.shared.program = data.title ?? ""
    }
    
    //For spacing of two items
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch (option) {
        case .spacing: return 50 // 8 points spacing
        default: return value
        }
    }
    
    func carousel(_ _carousel: iCarousel, itemTransformForOffset offset: CGFloat, baseTransform atransform: CATransform3D) -> CATransform3D {
        let distance: Float = 130.00
        //number of pixels to move the items away from camera
        let z: CGFloat = CGFloat(-fminf(1.0, Float(CGFloat(abs(offset)))) * distance)
        return CATransform3DTranslate(atransform, offset * 1.15 * _carousel.itemWidth, 0.0, z)
    }
}
