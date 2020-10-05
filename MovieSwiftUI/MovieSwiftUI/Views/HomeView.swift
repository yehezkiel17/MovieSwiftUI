//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var nowPlayingCollectionViewModel: CardCollectionViewModel
	@ObservedObject var upcomingCollectionViewModel: CardCollectionViewModel
	
    var body: some View {
		NavigationView {
			List {
				Group {
					CardCollectionView(viewModel: nowPlayingCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: upcomingCollectionViewModel)
				}
			}
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		let nowPlayingCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.upcoming,
			cardOrientationType: .portrait
		)
		
		let upcomingCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.upcoming,
			cardOrientationType: .landscape
		)
		
		nowPlayingCollectionViewModel.movies = Movie.dummyMovies
		upcomingCollectionViewModel.movies = Movie.dummyMovies
		
		return HomeView(
			nowPlayingCollectionViewModel: nowPlayingCollectionViewModel,
			upcomingCollectionViewModel: upcomingCollectionViewModel)
    }
}
