//
//  CarProtocol.swift
//  RacingSwift
//
//  Created by Дмитрий Зубарев on 08.05.2021.
//

import Foundation

protocol Car : Codable {
    var name: String { get }
    var model: String { get }
    var speedOfRoad : Double { get }
    var speedOfCar : Double { get }
    var speedOfAnotherCar : Double { get }
    var roadType: String { get }
}
