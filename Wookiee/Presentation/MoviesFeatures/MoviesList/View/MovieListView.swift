//
//  ContentView.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 03/05/2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var viewModel: DefaultMoviesViewModel
    
    init(viewModel: DefaultMoviesViewModel) {
        self.viewModel = viewModel
    }
    
    private let columns = [GridItem()]
    private let rows = [GridItem()]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                HStack {
                    Text("Wookiee")
                        .font(.title).bold()
                        .foregroundColor(.font)
                        .padding()
                    Spacer()
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        VStack {
                            Divider()
                                .padding([.leading, .trailing])
                            
                            HStack {
                                Text(category)
                                    .font(.title3).bold()
                                    .foregroundColor(.font)
                                Spacer()
                            }
                            .padding([.leading])
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: rows, alignment: .center) {
                                    ForEach(viewModel.movie(for: category), id: \.self) { movie in
                                        MovieCellView(thumbnailURL: movie.posterURL ?? URL(string: "")!,
                                                      title: movie.title ?? "",
                                                      rating: "\(movie.rating ?? 0.0)")
                                        .padding(.horizontal, 2)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear(perform: perform)
    }
    
    private func perform() {
        viewModel.loadView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: DependencyContainer().makeMockMoviesViewModel())
    }
}
