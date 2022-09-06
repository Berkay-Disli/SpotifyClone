//
//  LargeHStackItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI
import Kingfisher

struct LargeHStackItem: View {
    let showArtist: Bool
    let title: String
    let artist: String
    let imageUrl: String
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: imageUrl))
                .resizable()
                //.scaledToFill()
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                if showArtist {
                    Text(artist)
                        .font(.system(size: 16))

                }
            }
            .foregroundColor(.white)
        }
        .frame(width: 150)
      
    }
}

struct LargeHStackItem_Previews: PreviewProvider {
    static var previews: some View {
        LargeHStackItem(showArtist: true, title: "Pain", artist: "Blackfield", imageUrl: "https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/cd/43/e7/cd43e76f-4ff1-f700-d84f-86eeea7fa5bb/828768588925.jpg/100x100bb.jpg")
    }
}
