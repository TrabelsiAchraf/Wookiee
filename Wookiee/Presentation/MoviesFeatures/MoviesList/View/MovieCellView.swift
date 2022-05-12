//
//  MovieCellView.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 03/05/2022.
//

import SwiftUI
import DomainKit

struct MovieCellView: View {
    var thumbnailURL: URL
    var title: String
    var rating: String
    
    var body: some View {
        VStack {
            AsyncImage(url: thumbnailURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 100, height: 150, alignment: .center)
                        .cornerRadius(10)
                } else {
                    Color.gray.opacity(0.4)
                        .frame(width: 100, height: 150, alignment: .center)
                        .cornerRadius(10)
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.background)
                        .frame(height: 30)
                }
                .opacity(0.75)
            }
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.stars)
                        Text(rating)
                            .foregroundColor(.font)
                        Spacer()
                    }
                    .font(.subheadline)
                }
                .padding([.trailing, .bottom], 5)
            }
           
            Text(title)
                .font(.caption).bold()
                .foregroundColor(.font)
                .frame(width: 100)
                .lineLimit(1)
        }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(thumbnailURL: movie1.posterURL ?? URL(string: "no_url")!,
                      title: movie1.title ?? "",
                      rating: "\(movie1.rating ?? 0.2)")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.background)
    }
}
