//
//  MovieView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 06/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieView: View {
	@ObservedObject var viewModel: MovieViewModel
	
	var image: UIImage? {
		guard let image = viewModel.image else {
			return nil
		}
		
		return image
	}
	
	var body: some View {
		List {
			posterView
			detailLabel
			overviewLabel
			Divider()
			if viewModel.similarCollectionViewModel.movies.count > 0 {
				similarList
			}
			Spacer()
		}
		.navigationBarTitle(viewModel.movie.title)
		.onAppear(perform: {
			self.viewModel.requestImage()
			self.viewModel.requestVideo()
		})
	}
	
	var posterView: some View {
		ZStack {
			Rectangle()
				.fill(Color.gray.opacity(0.4))
			
			if image != nil {
				Image(uiImage: image ?? UIImage())
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: viewModel.getImageWidth(),
						   height: viewModel.getImageHeight(),
						   alignment: .top)
				
				Button(action: {
					print("Edit button was tapped")
				}) {
					Image("ico-play")
						.renderingMode(.original)
				}
			}
		}
		.aspectRatio(contentMode: .fill)
		.frame(width: viewModel.getImageWidth(),
			   height: viewModel.getImageHeight(),
			   alignment: .top)
		.clipped()
		.padding(.leading, -20)
		.buttonStyle(PlainButtonStyle())
	}
	
	var detailLabel: some View {
		HStack {
			Text(viewModel.getMovieAtrributes())
				.font(.caption)
			
			Spacer()
		}
	}
	
	var overviewLabel: some View {
		Text(viewModel.movie.overview)
			.font(.body)
	}
	
	var similarList: some View {
		Group {
			CardCollectionView(viewModel: viewModel.similarCollectionViewModel)
		}
	}
}

struct MovieView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = MovieViewModel(movie: Movie.dummyMovie)
		return MovieView(viewModel: viewModel)
	}
}
