//
//  CardCollectionView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct CardCollectionView: View {
	
	let title: String
	let movies: [Movie]
	
    var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(title)
				.font(.title)
				.fontWeight(.bold)
				.padding(.horizontal)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 0) {
					ForEach(self.movies, id: \.self) { movie in
						LandscapeCardView(movie: movie)
							.frame(width: 256, height: 180)
							.padding(.leading, 16)
							.padding(.trailing, 16)
					}
				}
			}
		}
    }
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
		CardCollectionView(title: Constant.upcoming, movies: Movie.dummyMovies)
    }
}
