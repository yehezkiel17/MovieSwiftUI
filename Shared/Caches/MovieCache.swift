//
//  MovieCache.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 03/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import Cache

class MovieCache {
	
	typealias Key = String
	typealias Value = [Movie]
	
	enum MovieKey: String, CaseIterable {
		case nowPlaying = "now-playing"
		case popular = "popular"
		case topRated = "top-rated"
		case upcoming = "upcoming"
		case similar = "similar-"
	}
	
	static let shared = MovieCache()
	
	private let storage: Storage<Key, Value>?
	private let storageName = Constant.movieStorage
	
	private init() {
		storage = try? Storage<Key, Value>(
			diskConfig: DiskConfig(name: storageName),
			memoryConfig: MemoryConfig(expiry: .never, countLimit: 1000, totalCostLimit: 100),
			transformer: TransformerFactory.forCodable(ofType: [Movie].self)
		)
	}
}

extension MovieCache: Cache {
	func save(value: Value, key: Key) {
		try? storage?.setObject(value, forKey: key)
	}
	
	func load(key: Key) -> Value? {
		guard let storage = storage else {
			return nil
		}
		
		return try? storage.object(forKey: key)
	}
	
	func remove(key: Key) {
		try? storage?.removeObject(forKey: key)
	}
}
