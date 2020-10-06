//
//  MovieVideo.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 07/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

struct MovieVideo: Codable, Hashable {
	let id: String
	let key: String
	let name: String
	let site: String
	let size: Int
	let type: String
}
