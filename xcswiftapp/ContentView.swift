//
//  ContentView.swift
//  xcswiftapp
//
//  Created by Andy Chunab on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
        }
        //Text("Hello, world!")
            //.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
