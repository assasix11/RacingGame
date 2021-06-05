//
//  CarManager.swift
//  RacingSwift
//
//  Created by Дмитрий Зубарев on 08.05.2021.
//

import Foundation

enum Cars {
    case defaultCar, jeep, fastCar
}

class CarChanging {
    static let carChanging = CarChanging()
    var chosenCar: Car = DefaultCar()
    func factory(car : Cars) {
        switch car {
        case .defaultCar:
            chosenCar = DefaultCar()
        case .jeep:
            chosenCar = JeepCar()
        case .fastCar:
            chosenCar = FastCar()
        }
    }
}
