//
//  FirstViewController.swift
//  DZ12_2_2
//
//  Created by Дмитрий Зубарев on 29.04.2021.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var setting: UIImageView!
    override func viewDidLoad() {
        buttonStart.layer.cornerRadius = 30
        buttonStart.setTitle("Старт", for: .normal)
        startButtonSettings()
        loadingCar()
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(openSettings))
        setting.addGestureRecognizer(tap)
        setting.isUserInteractionEnabled = true
        view.backgroundColor = .white
    }
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: false, completion: completion)
      }
    func loadingCar() {
        if let managerLoad = UserDefaults.standard.string(forKey: "result") {
            switch managerLoad {
            case "jeep":
                print("jeep")
                CarChanging.carChanging.factory(car: .jeep)
            case "fastCar":
                print("fastCar")
                CarChanging.carChanging.factory(car: .fastCar)
            case "defaultCar":
                print("defaultCar")
                CarChanging.carChanging.factory(car: .defaultCar)
            default:
                print("defaultCar2")
                CarChanging.carChanging.factory(car: .defaultCar)
            }
        }
    }
    @objc func openSettings() {
        print("smth")
        let homeView = SettingsViewController()
        present(homeView, animated: true, completion: nil)
    }
    func startButtonSettings() {
        resultButton.setTitle("Результаты", for: .normal)
        resultButton.layer.borderWidth = 1
        resultButton.layer.borderColor = UIColor.black.cgColor
        resultButton.layer.cornerRadius = 30
        view.addSubview(resultButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentTable))
        resultButton.addGestureRecognizer(tap)
    }
    @objc func presentTable() {
        let tableView = TableViewController()
        present(tableView, animated: true, completion: nil)
    }
}
