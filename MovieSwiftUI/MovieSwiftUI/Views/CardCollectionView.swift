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
		VStack(alignment: .leading, spacing: 8) {
			Text(viewModel.title)
				.font(.title)
				.fontWeight(.bold)
				.padding(.horizontal)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 0) {
					ForEach(viewModel.movies, id: \.self) { movie in
						CardView(viewModel: self.createCardViewModel(movie: movie))
							.frame(width: self.viewModel.getWidth(), height: self.viewModel.getHeight())
							.padding(.leading, 16)
							.padding(.trailing, 16)
					}
				}
			}
		}
		.onAppear(perform: {
			DispatchQueue.global().async {
				self.viewModel.requestMovie()
			}
		})
    }
	
	func createCardViewModel(movie: Movie) -> CardViewModel {
		return CardViewModel(movie: movie, cardOrientationType: viewModel.cardOrientationType)
	}
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
		let viewModel = CardCollectionViewModel(
			title: Constant.upcoming,
			cardOrientationType: .landscape
		)
		
		viewModel.movies = Movie.dummyMovies
		
		return CardCollectionView(viewModel: viewModel)
    }
}
