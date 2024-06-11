//
//  WallpaperApp.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

@main
struct WallpaperApp: App {
    init() {
        ImageCacheManager.shared.setConfiguration(config: .init(cacheCountLimit: 100, totalSpaceLimitInBytes: 1024*1024*100))
    }
    
    var body: some Scene {
        WindowGroup {
            CoreTabBar()
        }
    }
}
