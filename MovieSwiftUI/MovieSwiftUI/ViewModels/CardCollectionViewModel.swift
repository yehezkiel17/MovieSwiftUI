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
	
	let title: SectionTitle
	let cardOrientationType: CardOrientationType
	let movieSession = MovieSession.shared
	
	@Published var movies: [Movie] = [Movie.dummyMovie]
	
	init(title: SectionTitle,
		 cardOrientationType: CardOrientationType) {
		self.title = title
		self.cardOrientationType = cardOrientationType
	}
	
	func requestMovie() {
		var path: Path
		
		switch title {
		case .nowPlaying:
			path = .nowPlaying
		case .popular:
			path = .popular
		case .topRated:
			path = .topRated
		case .upcoming:
			path = .upcoming
		}
		
		movieSession.getMovies(path: path, successCompletion: { [weak self] response in
			guard let self = self else {
				return
			}
			
			self.movies = response.results
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
			return 176
		case .portrait:
			return 280
		}
	}
	
	func getLeadingPadding(movie: Movie) -> CGFloat {
		let firstId = self.movies.first?.id ?? 0
		let padding: CGFloat = movie.id == firstId ? 0 : 8
		return padding
	}
	
	func getTrailingPadding(movie: Movie) -> CGFloat {
		let lastId = self.movies.last?.id ?? 0
		let padding: CGFloat = movie.id == lastId ? 0 : 8
		return padding
	}
}
