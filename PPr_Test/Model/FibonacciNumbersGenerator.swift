//
//  FibonacciNumbersGenerator.swift
//  PPr_Test
//
//  Created by Макс on 25.08.2021.
//

import Foundation


class FibonacciNumbersGenerator: NumbersGenerator {
	
	override func getNextNumber() -> Double {
		if numbers.isEmpty {
			return 0
		} else if numbers.count == 1 {
			return 1
		} else {
			return numbers[numbers.count - 1] + numbers[numbers.count - 2]
		}
	}
}
