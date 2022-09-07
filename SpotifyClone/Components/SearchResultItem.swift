//
//  SearchResultItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 7.09.2022.
//

import SwiftUI
import Kingfisher

struct SearchResultItem: View {
    let trackName: String
    let artistName: String
    let imageUrl: String
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(trackName)
                
                Text(artistName)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.top)
        .frame(height: 55)
    }
}

struct SearchResultItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultItem(trackName: "Bones", artistName: "Low Roar", imageUrl: "https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/cd/43/e7/cd43e76f-4ff1-f700-d84f-86eeea7fa5bb/828768588925.jpg/100x100bb.jpg")
    }
}
