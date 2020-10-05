//
//  CardCollectionView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct CardCollectionView: View {
	
	@ObservedObject var viewModel: CardCollectionViewModel
	
    var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text(viewModel.title.rawValue)
				.font(.title)
				.fontWeight(.bold)
			
			movieList
		}
    }
	
	var movieList: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			
			HStack(alignment: .top, spacing: 0) {
				
				ForEach(viewModel.movies, id: \.self) { movie in
					
					NavigationLink(destination: MovieView(viewModel: MovieViewModel(movie: movie)), label: {
						
						CardView(viewModel: self.createCardViewModel(movie: movie))
							.frame(width: self.viewModel.getWidth(), height: self.viewModel.getHeight())
							.padding(.leading, self.viewModel.getLeadingPadding(movie: movie))
							.padding(.trailing, self.viewModel.getTrailingPadding(movie: movie))
					})
				}
				.buttonStyle(PlainButtonStyle())
			}
		}
	}

	func createCardViewModel(movie: Movie) -> CardViewModel {
		return CardViewModel(movie: movie, cardOrientationType: viewModel.cardOrientationType)
	}
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
		let viewModel = CardCollectionViewModel(
			title: SectionTitle.upcoming,
			cardOrientationType: .portrait
		)
		
		viewModel.movies = Movie.dummyMovies
		
		return CardCollectionView(viewModel: viewModel)
    }
}
