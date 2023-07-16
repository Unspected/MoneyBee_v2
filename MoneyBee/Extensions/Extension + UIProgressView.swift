//
//  Extension + UIProgressView.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 7/16/23.
//

import UIKit

extension UIProgressView {
    
    func changeTintColorProgressView() {
        if self.progress < 0.4 {
            self.tintColor = .greenColor
        } else if self.progress > 0.6 {
            self.tintColor = .redColor
        } else {
            self.tintColor = .yellow
        }
    }
}

