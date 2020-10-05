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
	@ObservedObject var popularCollectionViewModel: CardCollectionViewModel
	@ObservedObject var topRatedCollectionViewModel: CardCollectionViewModel
	@ObservedObject var upcomingCollectionViewModel: CardCollectionViewModel
	
    var body: some View {
		NavigationView {
			List {
				Group {
					CardCollectionView(viewModel: nowPlayingCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: popularCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: topRatedCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: upcomingCollectionViewModel)
				}
			}
			.navigationBarTitle(Constant.homeTitle)
		}
		.onAppear(perform: {
			UITableView.appearance().separatorStyle = .none
		})
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		let nowPlayingCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.upcoming,
			cardOrientationType: .portrait
		)
		
		let popularCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.popular,
			cardOrientationType: .landscape
		)
		
		let topRatedCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.topRated,
			cardOrientationType: .landscape
		)
		
		let upcomingCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.upcoming,
			cardOrientationType: .landscape
		)
		
		nowPlayingCollectionViewModel.movies = Movie.dummyMovies
		popularCollectionViewModel.movies = Movie.dummyMovies
		topRatedCollectionViewModel.movies = Movie.dummyMovies
		upcomingCollectionViewModel.movies = Movie.dummyMovies
		
		return HomeView(
			nowPlayingCollectionViewModel: nowPlayingCollectionViewModel,
			popularCollectionViewModel: popularCollectionViewModel,
			topRatedCollectionViewModel: topRatedCollectionViewModel,
			upcomingCollectionViewModel: upcomingCollectionViewModel
		)
    }
}
