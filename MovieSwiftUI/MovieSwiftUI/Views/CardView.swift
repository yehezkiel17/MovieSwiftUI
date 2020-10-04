//
//  CardView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 04/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct CardView: View {
	
	let movie: Movie
	
	var image: UIImage? {
		guard let image = imageCache.load(key: String(movie.id)) else {
			return nil
		}
		
		return image
	}
	
	var movieSession = MovieSession.shared
	
	@ObservedObject var imageCache = ImageCache.shared
	
	var body: some View {
		VStack(alignment: .leading) {
			ZStack {
				Rectangle()
					.fill(Color.gray.opacity(0.4))
				
				if image != nil {
					Image(uiImage: image ?? UIImage())
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 256, height: 144, alignment: .top)
				}
			}
			.aspectRatio(contentMode: .fill)
			.frame(width: 256, height: 144, alignment: .top)
			.clipped()
			.cornerRadius(16)
			.shadow(radius: 4)
			
			Text(movie.title)
		}
		.onAppear(perform: {
			self.movieSession.getImage(
				id: String(self.movie.id),
				path: self.movie.posterPath ?? ""
			)
		})
	}
}

struct LandscapeCardView_Previews: PreviewProvider {
	static var previews: some View {
		CardView(movie: Movie.dummyMovie)
	}
}
