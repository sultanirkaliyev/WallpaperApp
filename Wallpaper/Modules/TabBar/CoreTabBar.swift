//
//  CoreTabBar.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI

fileprivate enum Constants {
    enum Tab {
        enum Description {
            static var tab1: String { "Главная" }
        }
        enum Icon {
            static let tab1 = "tab1"
        }
    }
}

enum TabItem: String, CaseIterable {
    case main
    
    var description: String {
        switch self {
        case .main:
            return Constants.Tab.Description.tab1
        }
    }
    
    var icon: String {
        switch self {
        case .main:
            return Constants.Tab.Icon.tab1
        }
    }
}

struct CoreTabBar: View {
    var body: some View {
        TabView {
            Group {
                MainPageView()
                    .tabItem {
                        Image(TabItem.main.icon)
                            .renderingMode(.template)
                            .foregroundColor(Color.white)
                        Text(TabItem.main.description)
                    }
            }
            .toolbarBackground(Color.init(hex: "#FFFFFF"), for: .tabBar)
        }
        .tint(Color.init(hex: "#3243D6"))
    }
}

#Preview {
    CoreTabBar()
}
