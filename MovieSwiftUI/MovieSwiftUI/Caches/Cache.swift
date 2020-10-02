//
//  Cache.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 03/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

protocol Cache {
	
	associatedtype Key
	associatedtype Value
	
	func save(value: Value, key: Key)
	
	func load(key: Key) -> Value?
	
	func remove(key: Key)
}
