//
//  ActivityIndicatorView.swift
//  SwiftUIMovieDb
//
//  Created by Andy Chunab on 09/02/21.
//  Copyright © 2021 Andy Chunab. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
