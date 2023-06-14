//
//  CustomLoader.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/06/23.
//

import Foundation
class CustomLoader: UIView {
    private let activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        activityIndicatorView.startAnimating()
    }
}
