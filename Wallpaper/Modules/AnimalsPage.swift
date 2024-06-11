//
//  AnimalsPage.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

struct AnimalsPage: View {
    
    // MARK: - Properties -
    @State private var images: [URL] = MockImageUrls.animalsUrls.compactMap({ URL(string: $0) })
    
    var body: some View {
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
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    AnimalsPage()
}
