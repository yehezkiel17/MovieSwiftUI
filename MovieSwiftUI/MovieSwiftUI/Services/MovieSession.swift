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
	
	func getMovies(path: CategoryPath,
				   successCompletion: ((MovieResponse) -> ())? = nil,
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
					let decodedResponse = try self.decoder.decode(MovieResponse.self, from: data)
					
					self.cachingResponse(path: path, result: decodedResponse.results)
					
					DispatchQueue.main.async {
						successCompletion?(decodedResponse)
					}
				} catch {
					print("ERROR")
				}
			}
		}.resume()
	}
	
	func getVideo(movie: inout Movie,
				  successCompletion: ((MovieVideoResponse) -> ())? = nil,
				  errorCompletion: ((Error?) -> ())? = nil) {
		
		var urlComponent = URLComponents()
		urlComponent.scheme = Constant.scheme
		urlComponent.host = Constant.host
		urlComponent.path = Constant.path + String(movie.id) + Constant.videoPath
		
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
					let decodedResponse = try self.decoder.decode(MovieVideoResponse.self, from: data)
					
					DispatchQueue.main.async {
						successCompletion?(decodedResponse)
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
					self.cachingImage(key: id, result: image)
				}
				
				DispatchQueue.main.async {
					successCompletion?(image)
				}
			}
		}.resume()
	}
	
	private func cachingResponse(path: CategoryPath, result: [Movie]) {
		var key: MovieCache.MovieKey
		
		switch path {
		case .nowPlaying:
			key = MovieCache.MovieKey.nowPlaying
		case .popular:
			key = MovieCache.MovieKey.popular
		case .topRated:
			key = MovieCache.MovieKey.topRated
		case .upcoming:
			key = MovieCache.MovieKey.upcoming
		}
		
		MovieCache.shared.save(value: result, key: key.rawValue)
	}
	
	private func cachingImage(key: String, result: UIImage) {
		ImageCache.shared.save(value: result, key: key)
	}
}
