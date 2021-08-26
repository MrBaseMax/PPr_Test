//
//  AbundantNumbersGenerator.swift
//  PPr_Test
//
//  Created by Макс on 26.08.2021.
//

import Foundation


class AbundantNumbersGenerator: NumbersGenerator {
	
	override func getNextNumber() -> Double {
		if let lastNumber = numbers.last {
			
			var nextAbundant = lastNumber + 1
			while !isAbundant( Int(nextAbundant) ) {
				nextAbundant += 1
			}
			
			return nextAbundant
			
		} else {
			return 12
		}
	}
	
	
	private func isAbundant( _ n: Int ) -> Bool {
		return getSum(n) > n
	}
	
	
	private func getSum( _ n: Int ) -> Int {
		var sum = 0 //сумма делителей
		
		for i in 1...Int(sqrt(Float(n))) {
			if n % i == 0 {
				sum = sum + i
				
				if n / i != i {
					sum = sum + (n / i)
				}
			}
		}
		
		return sum - n
	}
}
