//
//  NumbersGenerator.swift
//  PPr_Test
//
//  Created by Макс on 25.08.2021.
//

import Foundation

class NumbersGenerator {
	
	//MARK: - атрибуты
	var numbers: [Double] = []
	

	
	//MARK: - методы
	func appendNextNumbers(_ count: Int) {
		for _ in 1...count {
			numbers.append( getNextNumber() )
		}
	}
	
	
	func getNextNumber() -> Double { return 0 }
	
	func getNumbersCount() -> Int { return numbers.count }
	
	func getNumber( by index: Int ) -> Double { return numbers[index] }

}
