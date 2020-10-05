//
//  HomeViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 06/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

class HomeViewModel: ViewModel, ObservableObject {
	@ObservedObject var nowPlayingCollectionViewModel: CardCollectionViewModel
	@ObservedObject var popularCollectionViewModel: CardCollectionViewModel
	@ObservedObject var topRatedCollectionViewModel: CardCollectionViewModel
	@ObservedObject var upcomingCollectionViewModel: CardCollectionViewModel
	
	init() {
		nowPlayingCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.nowPlaying,
			cardOrientationType: .portrait
		)
		
		popularCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.popular,
			cardOrientationType: .landscape
		)
		
		topRatedCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.topRated,
			cardOrientationType: .landscape
		)
		
		upcomingCollectionViewModel = CardCollectionViewModel(
			title: SectionTitle.upcoming,
			cardOrientationType: .landscape
		)
	}
}
