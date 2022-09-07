//
//  MediumHStackItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI
import Kingfisher

struct MediumHStackItem: View {
    let title: String
    let artist: String
    let imageUrl: String
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                
                Text(artist)
            }
            .foregroundColor(.white)
        }
        .frame(width: 120)
    }
}

struct MediumHStackItem_Previews: PreviewProvider {
    static var previews: some View {
        MediumHStackItem(title: "Bones", artist: "Low Roar", imageUrl: "https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/cd/43/e7/cd43e76f-4ff1-f700-d84f-86eeea7fa5bb/828768588925.jpg/100x100bb.jpg")
    }
}
