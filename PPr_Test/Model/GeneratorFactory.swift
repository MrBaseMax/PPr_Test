//
//  GeneratorFactory.swift
//  PPr_Test
//
//  Created by Макс on 26.08.2021.
//

import Foundation

class GeneratorFactory {
	
	static func getGenerator(_ mode: Mode) -> Generator? {
		switch mode {
			case .prime:
				return PrimeNumbersGenerator()
			case .fibonacci:
				return FibonacciNumbersGenerator()
			case .abundant:
				return AbundantNumbersGenerator()
		}
		
	}
}
