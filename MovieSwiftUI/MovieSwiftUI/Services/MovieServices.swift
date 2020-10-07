//
//  MovieServices.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import UIKit

protocol MovieServices {
	func getMovies(path: CategoryPath,
				   successCompletion: ((MovieResponse) -> Void)?,
				   errorCompletion: ((Error?) -> Void)?)
	
	func getVideo(movie: inout Movie,
				  successCompletion: ((MovieVideoResponse) -> Void)?,
				  errorCompletion: ((Error?) -> Void)?)
	
	func getImage(id: String,
				  path: String,
				  successCompletion: ((UIImage) -> Void)?,
				  errorCompletion: ((Error?) -> Void)?)
}
