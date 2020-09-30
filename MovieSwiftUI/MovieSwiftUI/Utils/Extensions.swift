//
//  Extensions.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

extension JSONDecoder {
	
	static var tmdbJsonDecoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .formatted(DateFormatter.tmdbDateFormatter)
		return decoder
	}
}

extension DateFormatter {
	
	static var tmdbDateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		
		return formatter
	}
}
