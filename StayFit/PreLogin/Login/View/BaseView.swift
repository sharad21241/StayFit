//
//  BaseView.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/06/23.
//

import Foundation
protocol BaseView {
    func showError(errorMessage: String)
    func showLoader()
    func hideLoader()
}
