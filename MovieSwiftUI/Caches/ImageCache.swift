//
//  ImageCache.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 04/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import UIKit
import Cache

class ImageCache {
	
	typealias Key = String
	typealias Value = UIImage
	
	static let shared = ImageCache()
	
	private let storage: Storage<UIImage>?
	private let storageName = Constant.imageStorage
	
	private init() {
		storage = try? Storage(
			diskConfig: DiskConfig(name: storageName),
			memoryConfig: MemoryConfig(expiry: .never, countLimit: 1000, totalCostLimit: 100),
			transformer: TransformerFactory.forImage()
		)
	}
}

extension ImageCache: Cache {
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
