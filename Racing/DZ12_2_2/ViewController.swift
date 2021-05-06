//
//  ViewController.swift
//  DZ12_2_2
//
//  Created by Дмитрий Зубарев on 13.04.2021.
//

import UIKit
import Darwin
class ViewController: UIViewController {
    var road: UIImageView!
    var road2: UIImageView!
    var car: UIImageView!
    var leftButton: UIButton!
    var rightButton: UIButton!
    var positionXCar: Int!
    var light: UIImageView!
    var znak: UIImageView!
    var fireCar: UIImageView!
    var redCar: UIImageView?
    var xRedCar: Int!
    var xBlackCar = 50
    var blackCar: UIImageView!
    var countOfAppearenceRedCar = 0
    var starAppearence = 0
    var defaultCar = CGRect(x: 0, y: 0, width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        anotherCars()
    }
    override func viewDidAppear(_ animated: Bool) {
        startRoadAnimation()
        carPosition()
        buildInterface()
        objoctsOnRoadAnimation()
    }
    @objc func leftButtonAction() {
        positionXCar -= 30
        if positionXCar < 0 {
            UIView.animate(withDuration: 0.5) {
                self.car.frame = CGRect(x: self.positionXCar,
                                        y: Int(UIScreen.main.bounds.height) - 350,
                                        width: 80,
                                        height: 200)
            } completion: { (_) in
                self.dismiss(animated: false, completion: nil)
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.car.frame = CGRect(x: self.positionXCar,
                                    y: Int(UIScreen.main.bounds.height) - 350,
                                    width: 80,
                                    height: 200)
        }
    }
    @objc func rightButtonAction() {
        positionXCar += 30
        if positionXCar > Int(UIScreen.main.bounds.width) - 80 {
            UIView.animate(withDuration: 0.5) {
                self.car.frame = CGRect(x: self.positionXCar,
                                        y: Int(UIScreen.main.bounds.height) - 350,
                                        width: 80,
                                        height: 200)
            } completion: { (_) in
                self.dismiss(animated: false, completion: nil)
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.car.frame = CGRect(x: self.positionXCar,
                                    y: Int(UIScreen.main.bounds.height) - 350,
                                    width: 80,
                                    height: 200)
        }
    }
    func carPosition() {
        positionXCar = Int(UIScreen.main.bounds.width)/2 - 40
        car = UIImageView(frame: CGRect(x: positionXCar,
                                        y: Int(UIScreen.main.bounds.height) - 350,
                                        width: 80,
                                        height: 200))
        let carView = UIImage(named: "car")
        car.image = carView
        view.addSubview(car)
    }
    func objoctsOnRoadAnimation() {
        light = UIImageView(frame: CGRect(x: -10,
                                          y: -170,
                                          width: 39,
                                          height: 169))
        let lightView = UIImage(named: "light")
        light.image = lightView
        view.addSubview(light)
        UIView.animate(withDuration: 2, delay: 2, options: .repeat) {
            self.light.frame = CGRect(x: -10,
                                      y: UIScreen.main.bounds.height + 170,
                                      width: 39,
                                      height: 169)
            self.crash(frameImage: self.light)
        }
        znak = UIImageView(frame: CGRect(x: Int(UIScreen.main.bounds.width) - 25, y: -111, width: 31, height: 110))
        let znakView = UIImage(named: "znak")
        znak.image = znakView
        view.addSubview(znak)
        UIView.animate(withDuration: 2, delay: 3, options: .repeat) {
            self.znak.frame = CGRect(x: Int(UIScreen.main.bounds.width) - 25,
                                     y: Int(UIScreen.main.bounds.height) + 111,
                                     width: 31,
                                     height: 110)
            self.crash(frameImage: self.znak)
        }
    }
    func startRoadAnimation() {
        road = UIImageView(frame: CGRect(x: 0,
                                         y: 0,
                                         width: UIScreen.main.bounds.width,
                                         height: UIScreen.main.bounds.height))
        let roadImage = UIImage(named: "дорога")
        road.image = roadImage
        view.addSubview(road)
        road2 = UIImageView(frame: CGRect(x: 0,
                                          y: -UIScreen.main.bounds.height + 10,
                                          width: UIScreen.main.bounds.width,
                                          height: UIScreen.main.bounds.height))
        let roadImage2 = UIImage(named: "дорога")
        road2.image = roadImage2
        view.addSubview(road2)
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveLinear]) {
            self.road.frame = CGRect(x: 0,
                                     y: UIScreen.main.bounds.height,
                                     width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.height)
        }
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveLinear]) {
            self.road2.frame = CGRect(x: 0,
                                      y: 10,
                                      width: UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height)
        }
    }
    func buildInterface() {
        leftButton = UIButton(frame: CGRect(x: 50, y: Int(UIScreen.main.bounds.height) - 100, width: 100, height: 50))
        leftButton.setTitle("<<<<", for: UIControl.State.normal)
        leftButton.backgroundColor = .black
        leftButton.layer.cornerRadius = 25
        view.addSubview(leftButton)
        rightButton = UIButton(frame: CGRect(x: Int(UIScreen.main.bounds.width) - 150,
                                             y: Int(UIScreen.main.bounds.height) - 100,
                                             width: 100,
                                             height: 50))
        rightButton.setTitle(">>>>", for: UIControl.State.normal)
        rightButton.backgroundColor = .black
        rightButton.layer.cornerRadius = 25
        view.addSubview(rightButton)
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
    }
    func anotherCars() {
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { _ in
            self.xRedCar = Int.random(in: 20...Int(UIScreen.main.bounds.width) - 97)
            self.redCar = UIImageView(frame: CGRect(x: self.xRedCar,
                                                    y: -200,
                                                    width: 77,
                                                    height: 200))
        let redCarView = UIImage(named: "redCar")
            self.redCar?.image = redCarView
            self.view.addSubview(self.redCar!)
            self.countOfAppearenceRedCar += 1
            UIView.animate(withDuration: 2.5, delay: 0, options: []) {
            self.redCar!.frame = CGRect(x: self.xRedCar,
                                        y: Int(UIScreen.main.bounds.height) + 200,
                                        width: 77,
                                        height: 200)
            self.crash(frameImage: self.redCar)
        } completion: { (_) in
            self.redCar!.removeFromSuperview()
          }
       }
    }
    func crash(frameImage: UIImageView?) {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) {_ in
            guard frameImage != nil else {
                return
            }
            let carReactengle = self.car.layer.presentation()?.frame
            let second = frameImage?.layer.presentation()?.frame
            if carReactengle!.intersects(second ?? self.defaultCar) == true {
                if self.starAppearence < 1 {
                    let star = UIImageView(frame: CGRect(x: (self.car.layer.presentation()?.frame.origin.x)!,
                                                         y: (self.car.layer.presentation()?.frame.origin.y)! - 55,
                                                         width: 116,
                                                         height: 105))
                let starImage = UIImage(named: "star")
                star.image = starImage
                    self.view.addSubview(star)
                    self.starAppearence = 1
                }
                Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) {_ in
                self.dismiss(animated: false, completion: nil)
                }
            }
        }
    }
}
