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
	var movie: Movie
	let movieSession = MovieSession.shared
	
	@Published var videoResponse: MovieVideoResponse?
	@Published var image: UIImage?
	@Published var url: URL?
	
	@ObservedObject var similarCollectionViewModel: CardCollectionViewModel
	
	init(movie: Movie) {
		self.movie = movie
		
		similarCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.similar,
			cardOrientationType: .landscape,
			movieId: String(movie.id)
		)
	}
	
	func requestVideo() {
		movieSession.getVideo(movie: &movie, successCompletion: { [weak self] response in
			guard let self = self else {
				return
			}
			
			self.movie.videoResponse = response
			self.videoResponse = response
			self.createURL()
		})
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
	
	func createURL() {
		let youtube = Constant.youtube
		
		videoResponse?.results.sort { result1, result2 in
			result1.size > result2.size
		}
		
		let trailer = videoResponse?.results.first(where: { video in
			return video.site.lowercased() == youtube
		})
		
		var urlComponent = URLComponents()
		urlComponent.scheme = Constant.scheme
		urlComponent.host = Constant.youtubeHost
		urlComponent.path = Constant.youtubePath
		
		let keyQuery = URLQueryItem(name: "v", value: trailer?.key)
		urlComponent.queryItems = [keyQuery]
		
		guard let url = urlComponent.url else {
			return
		}
		
		self.url = url
	}
}
