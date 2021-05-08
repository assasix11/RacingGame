//
//  UIButtonExtension.swift
//  RacingSwift
//
//  Created by Дмитрий Зубарев on 08.05.2021.
//

import Foundation
import UIKit

extension UIButton {
    func makeSwadowWithCorners(button: UIButton) -> UIButton {
        button.layer.cornerRadius = 30
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 20
        button.layer.shadowOffset = CGSize(width: 0, height: 20)
        return button
    }
}
