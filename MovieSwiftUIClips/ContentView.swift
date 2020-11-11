//
//  ContentView.swift
//  MovieSwiftUIClips
//
//  Created by Yehezkiel Litbagay on 12/11/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var deeplinkMovieId: Int?
	
    var body: some View {
		HomeView(viewModel: HomeViewModel())
			.sheet(item: $deeplinkMovieId, content: { id in
				NavigationView {
					MovieView(viewModel: MovieViewModel(movie: Movie.dummyMovie))
				}
			})
			.onContinueUserActivity(NSUserActivityTypeBrowsingWeb,
									perform: handleUserActivity)
    }
	
	private func handleUserActivity(_ userActivity: NSUserActivity) {
		guard let incomingURL = userActivity.webpageURL,
			  let urlComponents = URLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
			  let queryItems = urlComponents.queryItems,
			  let id = queryItems.first(where: { $0.name == "id" })?.value else {
			deeplinkMovieId = nil
			return
		}
		
		deeplinkMovieId = Int(id)
	}
}

extension Int: Identifiable {
	public var id: Int {
		self
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
