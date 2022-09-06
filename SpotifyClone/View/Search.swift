//
//  Search.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct Search: View {
    @State private var searchText = ""
    let userColumns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
    let colors: [Color] = [.purple, .orange, .red, .green, .pink, .blue, .brown]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .foregroundColor(.gray)
                        
                        TextField("", text: $searchText)
                            .placeholder(when: searchText.isEmpty) {
                                Text("Artists or songs")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(uiColor: .darkGray))
                            }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(.white)
                    .padding([.horizontal, .bottom])
                    
                    LazyVStack {
                        // Your favourites
                        VStack(alignment: .leading) {
                            Text("Your favourite genres")
                                .fontWeight(.medium)
                            
                            LazyVGrid(columns: userColumns) {
                                ForEach(UserSearchGrid.allCases, id:\.self) { item in
                                    LargeGridItem(title: item.title, color: self.colors.randomElement() ?? .black)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Search")
        }
        
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}


extension View {
    func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
