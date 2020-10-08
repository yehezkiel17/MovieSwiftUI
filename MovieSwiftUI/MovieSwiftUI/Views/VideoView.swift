//
//  VideoView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 08/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct VideoView: UIViewRepresentable {
	
	var videoURL: URL
	var previewLength: Double?
	
	func makeUIView(context: Context) -> UIView {
		return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength ?? 15)
	}
	
	func updateUIView(_ uiView: UIView, context: Context) {
		
	}
}
