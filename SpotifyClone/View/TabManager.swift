//
//  TabManager.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct TabManager: View {
    @EnvironmentObject var navVM: NavigationViewModel
    @StateObject var musicsVM = MusicsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: Displayed Page
            switch navVM.selectedTab {
            case .home:
                Home(musicsVM: musicsVM)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .search:
                Search()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .library:
                Text("Library View")
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            // MARK: TabView
            tabView
                .zIndex(1)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabManager_Previews: PreviewProvider {
    static var previews: some View {
        TabManager()
            .environmentObject(NavigationViewModel())
    }
}

extension TabManager {
    var tabView: some View {
        HStack {
            ForEach(Tabs.allCases, id: \.self) { tab in
                HStack {
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: navVM.selectedTab == tab ?  "\(tab.icon).fill":tab.icon)
                            .font(.system(size: 30))
                        
                        Text(tab.title)
                            .font(.callout)
                            .fontWeight(navVM.selectedTab == tab ? .medium:.regular)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            navVM.selectTab(tab: tab)
                        }
                    }

                    
                    Spacer()
                }
            }
        }
        .frame(height: 110)
        .padding(.bottom, 10)
        .background {
            LinearGradient(colors: [.black, .black, .black, .clear], startPoint: .bottom, endPoint: .top)
        }
        
    }
}
