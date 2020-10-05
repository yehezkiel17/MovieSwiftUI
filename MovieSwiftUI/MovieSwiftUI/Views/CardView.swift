//
//  CardView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 04/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct CardView: View {
	
	@ObservedObject var viewModel: CardViewModel
	
	var image: UIImage? {
		guard let image = viewModel.image else {
			return nil
		}
		
		return image
	}

	var body: some View {
		VStack(alignment: .leading) {
			ZStack {
				Rectangle()
					.fill(Color.gray.opacity(0.4))
				
				if image != nil {
					Image(uiImage: image ?? UIImage())
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: self.viewModel.getWidth(), height: self.viewModel.getHeight(), alignment: .top)
				}
			}
			.aspectRatio(contentMode: .fill)
			.frame(width: self.viewModel.getWidth(), height: self.viewModel.getHeight(), alignment: .top)
			.clipped()
			.cornerRadius(16)
			.shadow(radius: 4)
			
			Text(viewModel.movie.title)
		}
		.onAppear(perform: {
			DispatchQueue.global().async {
				self.viewModel.requestImage()
			}
		})
	}
}

struct LandscapeCardView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = CardViewModel(movie: Movie.dummyMovie, cardOrientationType: .portrait)
		return CardView(viewModel: viewModel)
	}
}
