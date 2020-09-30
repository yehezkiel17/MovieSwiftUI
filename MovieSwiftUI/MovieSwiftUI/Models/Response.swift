//
//  GeneralResponse.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

struct Response: Codable {
	let page: Int
	let totalResults: Int
	let totalPages: Int
	let results: [Movie]
}
