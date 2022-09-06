//
//  LargeHStackItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct LargeHStackItem: View {
    let showArtist: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle().fill(.purple)
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Song name")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                if showArtist {
                    Text("Artist")
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct LargeHStackItem_Previews: PreviewProvider {
    static var previews: some View {
        LargeHStackItem(showArtist: true)
    }
}
