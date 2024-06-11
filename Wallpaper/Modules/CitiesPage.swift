//
//  CitiesPage.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

fileprivate enum Constants {
    enum Icon {
        static let imageFailure = "image_failure"
    }
}

struct CitiesPage: View {
    
    // MARK: - Properties -
    @State private var images: [URL] = MockImageUrls.citiesUrls.compactMap({ URL(string: $0) })
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
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
                            } errorPlaceholderView: {
                                Image(Constants.Icon.imageFailure)
                                    .resizable()
                                    .scaledToFill()
                            }
                            .frame(width: geometry.size.width / 3 - 16, height: 100)
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
    CitiesPage()
}
