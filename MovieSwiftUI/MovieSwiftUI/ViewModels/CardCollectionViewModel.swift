//
//  CardCollectionViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

class CardCollectionViewModel: ViewModel, ObservableObject {
	
	let title: String
	let cardOrientationType: CardOrientationType
	let movieSession = MovieSession.shared
	
	@Published var movies: [Movie] = [Movie.dummyMovie]
	
	init(title: String,
		 cardOrientationType: CardOrientationType) {
		self.title = title
		self.cardOrientationType = cardOrientationType
	}
	
	func requestMovie() {
		movieSession.getMovies(path: .upcoming, successCompletion: { [weak self] response in
			guard let self = self else {
				return
			}
			
			self.movies = response.results
		})
	}
	
	func getWidth() -> CGFloat {
		switch cardOrientationType {
		case .portrait:
			return 256
		case .landscape:
			return 144
		}
	}
	
	func getHeight() -> CGFloat {
		switch cardOrientationType {
		case .portrait:
			return 176
		case .landscape:
			return 288
		}
	}
}
