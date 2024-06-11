//
//  NaturePage.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

struct NaturePage: View {
    
    // MARK: - Properties -
    @State private var images: [URL] = MockImageUrls.natureUrls.compactMap({ URL(string: $0) })
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(images, id: \.self) { imageUrl in
                        VStack {
                            URLImage(url: imageUrl) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                            } progressView: { progress in
                                VStack {
                                    ProgressView()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.black.opacity(0.2))
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
    NaturePage()
}
