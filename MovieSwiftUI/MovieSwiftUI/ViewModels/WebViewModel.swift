//
//  WebViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 10/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

class WebViewModel: ViewModel {
	let videoURL: URL
	let frame: CGRect
	
	init(videoURL: URL, frame: CGRect) {
		self.videoURL = videoURL
		self.frame = frame
	}
}
