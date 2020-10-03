//
//  ViewBinding.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 04/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

protocol ViewBinding {
	
	associatedtype VM = ViewModel
	
	var viewModel: VM? { get }
	
	func bindViewModel(viewModel: VM?)
}
