//
//  MovieServices.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

protocol MovieServices {
	func getMovies(url: String, completion: @escaping (Result<Response, Error>) -> ())
}
