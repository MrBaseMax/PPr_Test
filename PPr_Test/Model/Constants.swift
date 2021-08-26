//
//  Constants.swift
//  PPr_Test
//
//  Created by Макс on 23.08.2021.
//

import Foundation
import UIKit


struct K {
	static let cellID = "ReusableCell"
	static let cellHeight: CGFloat = 60
	static let cellsLeftToStartFetching = 20
	static let initialRowsCount = 30
	static let batchSize = 40
	
	struct segmentIndex {
		static let prime     = 0
		static let fibonacci = 1
		static let abundant  = 2
	}
	
	struct cellBgColor {
		static let light = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		static let dark = #colorLiteral(red: 0.7921568627, green: 0.9098039216, blue: 0.9921568627, alpha: 0.396789867)
	}
}
