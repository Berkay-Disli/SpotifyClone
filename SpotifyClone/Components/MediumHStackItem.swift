//
//  MediumHStackItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct MediumHStackItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle().fill(.purple)
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Song name")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                
                Text("Artist")
            }
            .foregroundColor(.white)
        }
    }
}

struct MediumHStackItem_Previews: PreviewProvider {
    static var previews: some View {
        MediumHStackItem()
    }
}
