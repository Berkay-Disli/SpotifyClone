//
//  SmallGridItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct SmallGridItem: View {
    let title: String
    let color: Color
    let icon: String
    var body: some View {
        HStack {
            Rectangle().fill(color)
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundColor(.white)
                }
            
            Text(title)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.ultraThinMaterial.opacity(0.33))
        .cornerRadius(5)
    }
}

struct SmallGridItem_Previews: PreviewProvider {
    static var previews: some View {
        SmallGridItem(title: "Playlist", color: .green, icon: "star")
    }
}
