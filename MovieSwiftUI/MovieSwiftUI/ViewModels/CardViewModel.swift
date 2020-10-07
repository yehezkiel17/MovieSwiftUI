//
//  CardViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

enum CardOrientationType {
	case portrait
	case landscape
}

class CardViewModel: ViewModel, ObservableObject {
	
	let movie: Movie
	let cardOrientationType: CardOrientationType
	let movieSession = MovieSession.shared
	let imageCache = ImageCache.shared
	
	@Published var image: UIImage?
	
	init(movie: Movie, cardOrientationType: CardOrientationType) {
		self.movie = movie
		self.cardOrientationType = cardOrientationType
		
		requestImage()
	}
	
	func getImage() {
		guard let image = imageCache.load(key: String(movie.id)) else {
			requestImage()
			return
		}
		
		DispatchQueue.main.async { [weak self] in
			self?.image = image
		}
	}
	
	func requestImage() {
		guard let path = movie.posterPath else {
			return
		}
		
		movieSession.getImage(id: String(movie.id), path: path, successCompletion: { [weak self] image in
			guard let self = self else {
				return
			}
			
			self.image = image
		})
	}
	
	func getWidth() -> CGFloat {
		switch cardOrientationType {
		case .landscape:
			return 256
		case .portrait:
			return 160
		}
	}
	
	func getHeight() -> CGFloat {
		switch cardOrientationType {
		case .landscape:
			return 144
		case .portrait:
			return 240
		}
	}
}
