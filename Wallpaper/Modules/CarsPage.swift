//
//  CarsPage.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

struct CarsPage: View {
    
    // MARK: - Properties -
    @State private var images: [URL] = MockImageUrls.carsUrls.compactMap({ URL(string: $0) })
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                    ForEach(images, id: \.self) { imageUrl in
                        VStack {
                            URLImage(url: imageUrl) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                            } progressView: { progress in
                                VStack {
                                    ProgressView()
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.black.opacity(0.2))
                            }
                            .frame(width: geometry.size.width / 2 - 16, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CarsPage()
}
