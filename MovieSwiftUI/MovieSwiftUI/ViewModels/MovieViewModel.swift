//
//  DetailViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 06/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

class MovieViewModel: ViewModel, ObservableObject {
	let movie: Movie
	let movieSession = MovieSession.shared
	
	@Published var image: UIImage?
	
	init(movie: Movie) {
		self.movie = movie
	}
	
	func requestVideo() {
		
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
	
	func getReleaseYear() -> String {
		guard let date = DateFormatter.tmdbYearFormatter.date(from: movie.releaseDate) else {
			return "2020"
		}
		
		let year = DateFormatter.tmdbYearFormatter.string(from: date)
		
		return year
	}
	
	func getMovieAtrributes() -> String {
		let releaseYear = getReleaseYear()
		let language = movie.originalLanguage.uppercased()
		let rating: Double = (movie.voteAverage * 10).rounded() / 10
		
		let attributes = "\(releaseYear) | \(language) | Rating: \(rating) of 10.0"
		
		return attributes
	}
	
	func getImageWidth() -> CGFloat {
		return UIScreen.main.bounds.width
	}
	
	func getImageHeight() -> CGFloat {
		return 9/16 * getImageWidth()
	}
}
