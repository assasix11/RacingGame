//
//  SettingsViewController.swift
//  RacingSwift
//
//  Created by Дмитрий Зубарев on 08.05.2021.
//

import UIKit

class SettingsViewController: UIViewController {
let buttonDismiss = UIImageView()
    let jeepBackView = UIView()
    let defaultCarView = UIView()
    let fastCarView = UIView()
    let scroll = UIScrollView(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200))
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 200, width: UIScreen.main.bounds.width, height: 150))
    
    override func viewDidLoad() {
        scroll.backgroundColor = .lightGray
        scroll.showsHorizontalScrollIndicator = false
        view.backgroundColor = .lightGray
        super.viewDidLoad()
        buttonDismiss.frame = CGRect(x: UIScreen.main.bounds.width - 90, y: 50, width: 65, height: 65)
        let imageBack = UIImage(named: "back")
        buttonDismiss.image = imageBack
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        let choseJeepTap = UITapGestureRecognizer(target: self, action: #selector(choseJeep))
        let choseFastCarTap = UITapGestureRecognizer(target: self, action: #selector(choseFastCar))
        let choseDeafultCarTap = UITapGestureRecognizer(target: self, action: #selector(deafultCar))
        buttonDismiss.addGestureRecognizer(tap)
        buttonDismiss.isUserInteractionEnabled = true
        view.addSubview(buttonDismiss)
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height - 200)
        scroll.isPagingEnabled = true
        view.addSubview(scroll)
        let jeep = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - (77 / 2), y: 0, width: 77, height: 195))
        jeep.image = UIImage(named: "jeep")
        let fastCar = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - (77 / 2) + UIScreen.main.bounds.width, y: 0, width: 77, height: 195))
        fastCar.image = UIImage(named: "fastCar")
        let defaultCar = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - (77 / 2) + UIScreen.main.bounds.width * 2 , y: 0, width: 77, height: 195))
        let labelJeep = UILabel(frame: CGRect(x: 40 , y: 220, width: UIScreen.main.bounds.width - 50, height: 200))
        let labelFastCar = UILabel(frame: CGRect(x: 40 + UIScreen.main.bounds.width, y: 220, width: UIScreen.main.bounds.width - 50, height: 200))
        let labelDefaultCar = UILabel(frame: CGRect(x: 40 + UIScreen.main.bounds.width * 2, y: 220, width: UIScreen.main.bounds.width - 50, height: 200))
        jeepBackView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 195)
        fastCarView.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: 195)
        defaultCarView.frame = CGRect(x: UIScreen.main.bounds.width * 2, y: 0, width: UIScreen.main.bounds.width, height: 195)
        jeepBackView.backgroundColor = .lightGray
        fastCarView.backgroundColor = .lightGray
        defaultCarView.backgroundColor = .lightGray
        labelJeep.text = JeepCar().name
        labelJeep.font = .systemFont(ofSize: 25)
        labelFastCar.text = FastCar().name
        labelFastCar.font = .systemFont(ofSize: 25)
        labelDefaultCar.text = DefaultCar().name
        labelDefaultCar.font = .systemFont(ofSize: 25)
        defaultCar.image = UIImage(named: "car")
        jeep.addGestureRecognizer(choseJeepTap)
        jeep.isUserInteractionEnabled = true
        fastCar.addGestureRecognizer(choseFastCarTap)
        fastCar.isUserInteractionEnabled = true
        defaultCar.addGestureRecognizer(choseDeafultCarTap)
        defaultCar.isUserInteractionEnabled = true
        pageControl.numberOfPages = 3
        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
        view.addSubview(pageControl)
        scroll.addSubview(jeepBackView)
        scroll.addSubview(fastCarView)
        scroll.addSubview(defaultCarView)
        scroll.addSubview(fastCar)
        scroll.addSubview(jeep)
        scroll.addSubview(defaultCar)
        scroll.delegate = self
        scroll.addSubview(labelJeep)
        scroll.addSubview(labelFastCar)
        scroll.addSubview(labelDefaultCar)
        let startText = UILabel(frame: CGRect(x: 40, y: 65, width: UIScreen.main.bounds.width - 50, height: 200))
        startText.font = .systemFont(ofSize: 30)
        startText.text = "Выберите машину"
        view.addSubview(startText)
    }
    @objc func back() {
        print("ths")
        dismiss(animated: false, completion: nil)
    }
    @objc func pageControlDidChange (_ sender: UIPageControl) {
        let current = sender.currentPage
        scroll.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    @objc func choseJeep() {
        CarChanging.carChanging.factory(car: .jeep)
        UserDefaults.standard.setValue("jeep", forKey: "result")
        jeepBackView.backgroundColor = .gray
        fastCarView.backgroundColor = .lightGray
        defaultCarView.backgroundColor = .lightGray
    }
    @objc func choseFastCar() {
        CarChanging.carChanging.factory(car: .fastCar)
        UserDefaults.standard.setValue("fastCar", forKey: "result")
        jeepBackView.backgroundColor = .lightGray
        fastCarView.backgroundColor = .gray
        defaultCarView.backgroundColor = .lightGray
    }
    @objc func deafultCar() {
        CarChanging.carChanging.factory(car: .defaultCar)
        UserDefaults.standard.setValue("defaultCar", forKey: "result")
        jeepBackView.backgroundColor = .lightGray
        fastCarView.backgroundColor = .lightGray
        defaultCarView.backgroundColor = .gray
    }
}
extension SettingsViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / scrollView.frame.size.width))
    }
}
