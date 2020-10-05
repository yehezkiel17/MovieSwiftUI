//
//  MovieSession.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 02/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import UIKit

class MovieSession: MovieServices {
	
	static let shared = MovieSession()
	
	private let urlSession = URLSession.shared
	private let decoder = JSONDecoder.tmdbJsonDecoder
	
	private init() {}
	
	func getMovies(path: Path,
				   successCompletion: ((Response) -> ())? = nil,
				   errorCompletion: ((Error?) -> ())? = nil) {
		
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
				errorCompletion?(error)
				return
			}
			
			if let data = data {
				do {
					let tmdbResponse = try self.decoder.decode(Response.self, from: data)
					
					self.cachingResponse(path: path, result: tmdbResponse.results)
					
					DispatchQueue.main.async {
						successCompletion?(tmdbResponse)
					}
				} catch {
					print("ERROR")
				}
			}
		}.resume()
	}
	
	func getImage(id: String,
				  path: String,
				  successCompletion: ((UIImage) -> ())? = nil,
				  errorCompletion: ((Error?) -> ())? = nil) {
		var urlComponent = URLComponents()
		urlComponent.scheme = Constant.scheme
		urlComponent.host = Constant.imageHost
		urlComponent.path = "\(Constant.imagePath)\(path)"
		
		guard let url = urlComponent.url else {
			return
		}
		
		urlSession.dataTask(with: url) { [weak self] (data, response, error) in
			guard let self = self, error == nil else {
				errorCompletion?(error)
				return
			}
			
			if let data = data {
				guard let image = UIImage(data: data) else {
					return
				}
				
				DispatchQueue.global().async {
//					self.cachingImage(key: id, result: image)
				}
				
				DispatchQueue.main.async {
					successCompletion?(image)
				}
			}
		}.resume()
	}
	
	private func cachingResponse(path: Path, result: [Movie]) {
		var key: MovieCache.MovieKey
		
		switch path {
		case .nowPlaying:
			key = MovieCache.MovieKey.nowPlaying
		case .upcoming:
			key = MovieCache.MovieKey.upcoming
		}
		
		MovieCache.shared.save(value: result, key: key.rawValue)
	}
	
	private func cachingImage(key: String, result: UIImage) {
		ImageCache.shared.save(value: result, key: key)
	}
}
