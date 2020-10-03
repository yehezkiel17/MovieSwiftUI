//
//  ImageCache.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 04/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import UIKit

class ImageCache: ObservableObject {
	
	typealias Key = String
	typealias Value = UIImage
	
	static let shared = ImageCache()
	
	private let userDefaults = UserDefaults.standard
	
	@Published var image: Value?
	
	private init() {}
}

extension ImageCache: Cache {
	func save(value: Value, key: Key) {
		let encodedString = value.pngData()?.base64EncodedString()
		userDefaults.set(encodedString, forKey: key)
		
		DispatchQueue.main.async { [weak self] in
			self?.image = value
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
