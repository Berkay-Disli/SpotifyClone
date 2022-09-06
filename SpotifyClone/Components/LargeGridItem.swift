//
//  LargeGridItem.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct LargeGridItem: View {
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(color)
        .cornerRadius(5)
        .padding(.bottom, 6)
    }
}

struct LargeGridItem_Previews: PreviewProvider {
    static var previews: some View {
        LargeGridItem(title: "Something", color: .red)
    }
}
