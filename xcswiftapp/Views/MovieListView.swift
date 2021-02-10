//
//  MovieListView.swift
//  xcswiftapp
//
// Created by Andy Chunab on 09/02/21.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    
    var body: some View {
        //TabView
        
        NavigationView {
            List {
                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: "", movies: nowPlayingState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if popularState.movies != nil {
                        MovieBackdropCarouselView(title: "Populares", movies: popularState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if topRatedState.movies != nil {
                        MovieBackdropCarouselView(title: "Mejor calificadas", movies: topRatedState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                    
                    
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                Group {
                    if upcomingState.movies != nil {
                        MovieBackdropCarouselView(title: "Próximos estrenos", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            .navigationBarTitle("PELICULAS")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.popularState.loadMovies(with: .popular)
            self.topRatedState.loadMovies(with: .topRated)
            self.upcomingState.loadMovies(with: .upcoming)
            
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
