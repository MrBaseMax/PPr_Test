//
//  PrimeNumbersGenerator.swift
//  PPr_Test
//
//  Created by Макс on 25.08.2021.
//

import Foundation


class PrimeNumbersGenerator: NumbersGenerator {
	
	override func getNextNumber() -> Double {
		if let lastNumber = numbers.last {
			
			var nextPrime = lastNumber + 1
			while !isPrime( Int(nextPrime) ) {
				nextPrime += 1
			}
			
			return nextPrime
			
		} else {
			return 2
		}
	}
	
	
	private func isPrime( _ n: Int ) -> Bool {
		if n <= 1 { return false }
		if n <= 3 { return true }
		if n % 2 == 0 || n % 3 == 0 { return false }
		
		var i = 5
		while i*i <= n {
			if n % i == 0 || n % (i+2) == 0 { return false }

			i += 6
		}
		
		return true
	}
}
