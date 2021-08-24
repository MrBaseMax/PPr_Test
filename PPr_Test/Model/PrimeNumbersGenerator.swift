//
//  PrimeNumbersGenerator.swift
//  PPr_Test
//
//  Created by Макс on 25.08.2021.
//

import Foundation


class PrimeNumbersGenerator: NumbersGenerator {
	
	override init() {
		super.init()
		numbers = [2]
	}
	
	

	override func getNextNumber() -> Double {
		var prime = numbers.last! + 1
		
		while !isPrime( Int(prime) ) {
			prime += 1
		}
		
		return prime;
	}
	
	
	
	private func isPrime( _ n: Int ) -> Bool{
		
		if n <= 1 { return false }
		if n <= 3 { return true }
		if n % 2 == 0 || n % 3 == 0 { return false }
		
		//нуу в этой ситуации мы просто наше к это самое мы уже здесь наши полномочия все. окончены
		for i in stride(from: 5, to: Int(sqrt(Double(n))), by: 6){
			if n % i == 0 || n % (i + 2) == 0 {
				return false
			}
		}
		
		return true
	}
}
