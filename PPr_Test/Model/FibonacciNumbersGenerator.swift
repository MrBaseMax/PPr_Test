//
//  FibonacciNumbersGenerator.swift
//  PPr_Test
//
//  Created by Макс on 25.08.2021.
//

import Foundation


class FibonacciNumbersGenerator: NumbersGenerator {
	
	override init() {
		super.init()
		numbers = [0,1]
	}
	
	
	
	override func getNextNumber() -> Double {
		return numbers[numbers.count - 1] + numbers[numbers.count - 2]
	}
}
