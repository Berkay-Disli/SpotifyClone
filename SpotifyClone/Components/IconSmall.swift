//
//  IconSmall.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct IconSmall: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.title3)
            .foregroundColor(.white)
            .padding(.horizontal, 6)
    }
}

struct IconSmall_Previews: PreviewProvider {
    static var previews: some View {
        IconSmall(iconName: "bell")
    }
}
