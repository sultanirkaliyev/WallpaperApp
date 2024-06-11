//
//  SpacePage.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

struct SpacePage: View {
    
    // MARK: - Properties -
    @State private var images: [URL] = MockImageUrls.spaceUrls.compactMap({ URL(string: $0) })
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(images, id: \.self) { imageUrl in
                        VStack {
                            URLImage(url: imageUrl, automaticDownload: false) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                            } progressView: { progress in
                                VStack {
                                    VStack(spacing: 16) {
                                        ProgressView()
                                        ProgressView(value: progress)
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(width: geometry.size.width, height: 150)
                            .clipShape(Rectangle())
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SpacePage()
}
