//
//  MovieCache.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 03/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

class MovieCache: ObservableObject {
	
	typealias Key = String
	typealias Value = [Movie]
	
	enum MovieKey: String, CaseIterable {
		case nowPlaying = "now-playing"
		case upcoming = "upcoming"
	}
	
	var keys: [String] = []
	
	static let shared = MovieCache()
	
	private let userDefaults = UserDefaults.standard
	
	private init() {}
}

extension MovieCache: Cache {
	func save(value: Value, key: Key) {
		if let movies = try? JSONEncoder().encode(value) {
			userDefaults.set(movies, forKey: key)
		}
	}
	
	func load(key: Key) -> [Movie]? {
		var movies: [Movie]?
		let decoder = JSONDecoder.tmdbJsonDecoder
		
		guard let data = userDefaults.data(forKey: key) else {
			return movies
		}
		
		do {
			movies = try decoder.decode([Movie].self, from: data)
		} catch {
			print(error.localizedDescription)
		}
		
		return movies
	}
	
	func remove(key: Key) {
		userDefaults.removeObject(forKey: key)
	}
}
