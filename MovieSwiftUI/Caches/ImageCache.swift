//
//  ImageCache.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 04/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import UIKit

class ImageCache {
	
	typealias Key = String
	typealias Value = UIImage
	
	static let shared = ImageCache()
	
	private let userDefaults = UserDefaults.standard
	
	private init() {}
}

extension ImageCache: Cache {
	func save(value: Value, key: Key) {
		
		DispatchQueue.global().async { [weak self] in
			let encodedString = value.pngData()?.base64EncodedString()
			self?.userDefaults.set(encodedString, forKey: key)
		}
	}
	
	func load(key: Key) -> Value? {
		guard let object = userDefaults.object(forKey: key) as? String,
			let data = Data(base64Encoded: object) else {
			return nil
		}
		
		let image = UIImage(data: data)
		
		return image
	}
	
	func remove(key: Key) {
		userDefaults.removeObject(forKey: key)
	}
}