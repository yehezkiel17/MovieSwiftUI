//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct HomeView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	
    var body: some View {
		NavigationView {
			List {
				Group {
					CardCollectionView(viewModel: viewModel.nowPlayingCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: viewModel.popularCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: viewModel.topRatedCollectionViewModel)
				}
				
				Group {
					CardCollectionView(viewModel: viewModel.upcomingCollectionViewModel)
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
		let viewModel = HomeViewModel()
		
		viewModel.nowPlayingCollectionViewModel.movies = Movie.dummyMovies
		viewModel.popularCollectionViewModel.movies = Movie.dummyMovies
		viewModel.topRatedCollectionViewModel.movies = Movie.dummyMovies
		viewModel.upcomingCollectionViewModel.movies = Movie.dummyMovies
		
		return HomeView(viewModel: viewModel)
    }
}
