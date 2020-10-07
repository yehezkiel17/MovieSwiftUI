//
//  MovieVideoResponse.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 07/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

struct MovieVideoResponse: Codable, Hashable {
	let id: Int
	let results: MovieVideo
}
