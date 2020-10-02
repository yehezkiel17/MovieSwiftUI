//
//  MovieSession.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 02/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

class MovieSession: MovieServices {
	
	static let shared = MovieSession()
	
	private let urlSession = URLSession.shared
	private let decoder = JSONDecoder.tmdbJsonDecoder
	
	private init() {}
	
	func getMovies(path: Path,
				   successCompletion: @escaping (Response) -> (),
				   errorCompletion: @escaping (Error?) -> ()) {
		
		var urlComponent = URLComponents()
		urlComponent.scheme = Constant.scheme
		urlComponent.host = Constant.host
		urlComponent.path = path.rawValue
		
		let apiKeyQuery = URLQueryItem(name: "api_key", value: Constant.apiKey)
		urlComponent.queryItems = [apiKeyQuery]
		
		guard let url = urlComponent.url else {
			return
		}
		
		urlSession.dataTask(with: url) { [weak self] (data, response, error) in
			guard let self = self, error == nil else {
				errorCompletion(error)
				return
			}
			
			if let data = data {
				do {
					let response = try self.decoder.decode(Response.self, from: data)
					DispatchQueue.main.async {
						successCompletion(response)
					}
				} catch {
					print("ERROR")
				}
			}
		}.resume()
	}
}
