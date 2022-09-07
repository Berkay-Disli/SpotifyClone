//
//  SearchCategoriesSubView.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 7.09.2022.
//

import SwiftUI

struct SearchCategoriesSubView: View {
    let userColumns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
    let colors: [Color] = [.purple, .orange, .red, .green, .pink, .blue, .brown]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                // Your favourites
                VStack(alignment: .leading) {
                    Text("Your favourite genres")
                        .fontWeight(.medium)
                        .padding(.top)
                    
                    LazyVGrid(columns: userColumns) {
                        ForEach(UserFavouriteGenres.allCases, id:\.self) { item in
                            LargeGridItem(title: item.title, color: self.colors.randomElement() ?? .black)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            LazyVStack {
                // Your favourites
                VStack(alignment: .leading) {
                    Text("Explore all")
                        .fontWeight(.medium)
                    
                    LazyVGrid(columns: userColumns) {
                        ForEach(AllGenres.allCases, id:\.self) { item in
                            LargeGridItem(title: item.title, color: self.colors.randomElement() ?? .black)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 76)
        }
    }
}

struct SearchCategoriesSubView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoriesSubView()
    }
}
