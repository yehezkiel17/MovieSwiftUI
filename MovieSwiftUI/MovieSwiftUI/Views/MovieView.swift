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
		NavigationView {
			VStack(spacing: 16) {
				posterView
				detailLabel
				overviewLabel
				Divider()
				Spacer()
			}
			.navigationBarTitle(viewModel.movie.title)
		}
		.onAppear(perform: {
			self.viewModel.requestImage()
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
						   height: viewModel.getImageHeight())
			}
		}
		.aspectRatio(contentMode: .fill)
		.frame(width: viewModel.getImageWidth(),
			   height: viewModel.getImageHeight(),
			   alignment: .top)
			.clipped()
	}
	
	var detailLabel: some View {
		HStack {
			Text(viewModel.getMovieAtrributes())
				.font(.caption)
				.padding(.leading, 16)
			
			Spacer()
		}
	}
	
	var overviewLabel: some View {
		Text(viewModel.movie.overview)
			.font(.body)
			.padding(16)
	}
}

struct MovieView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = MovieViewModel(movie: Movie.dummyMovie)
		return MovieView(viewModel: viewModel)
	}
}
