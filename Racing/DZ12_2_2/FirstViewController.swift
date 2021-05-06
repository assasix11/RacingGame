//
//  FirstViewController.swift
//  DZ12_2_2
//
//  Created by Дмитрий Зубарев on 29.04.2021.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: false, completion: completion)
      }
}
