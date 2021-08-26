//
//  Generator.swift
//  PPr_Test
//
//  Created by Макс on 26.08.2021.
//

import Foundation

protocol Generator {
	func appendNextNumbers(_ count: Int)
	func getNextNumber() -> Double
	func getNumbersCount() -> Int
	func getNumber(by index: Int) -> Double
}
