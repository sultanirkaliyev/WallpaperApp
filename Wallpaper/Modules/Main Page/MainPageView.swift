//
//  MainPageView.swift
//  Wallpaper
//
//  Created by Sultan Irkaliyev on 09.06.2024.
//

import SwiftUI
import URLImage

fileprivate enum Constants {
    enum URL {
        static let animals = "https://avatars.mds.yandex.net/i?id=877f03466d68e2341e72ffeeffccb1006c5f93da-9570000-images-thumbs&n=13"
        static let cities = "https://avatars.mds.yandex.net/i?id=c0cd64739c7b67640634b17bb4e3be7262ed36c3-12647654-images-thumbs&n=13"
        static let cars = "https://avatars.mds.yandex.net/i?id=8d29871079e07c9142f521cfa42da20b553d77ec-11454708-images-thumbs&n=13"
        static let nature = "https://avatars.mds.yandex.net/i?id=625e9ad73b1ac7ce460b94ae739e11d8fafd49a6-9857422-images-thumbs&n=13"
        static let space = "https://avatars.mds.yandex.net/i?id=4f311a5f72fa0219d2d3a157e5420586ec5c84df-10681994-images-thumbs&n=13"
    }
    enum Text {
        static let navigationTitle = "Категории"
        static let animals = "Животные"
        static let cities = "Города"
        static let cars = "Автомобили"
        static let nature = "Природа"
        static let space = "Космос"
    }
}

struct MainPageView: View {
    var body: some View {
        NavigationView {
            List {
                CategoryBlock(url: Constants.URL.animals, title: Constants.Text.animals)
                    .background(
                        NavigationLink("", destination: AnimalsPage())
                    )
                CategoryBlock(url: Constants.URL.cities, title: Constants.Text.cities)
                    .background(
                        NavigationLink("", destination: CitiesPage())
                    )
                CategoryBlock(url: Constants.URL.cars, title: Constants.Text.cars)
                    .background(
                        NavigationLink("", destination: CarsPage())
                    )
                CategoryBlock(url: Constants.URL.nature, title: Constants.Text.nature)
                    .background(
                        NavigationLink("", destination: NaturePage())
                    )
                CategoryBlock(url: Constants.URL.space, title: Constants.Text.space)
                    .background(
                        NavigationLink("", destination: SpacePage())
                    )
            }
            .navigationTitle(Constants.Text.navigationTitle)
        }
    }
    
    @ViewBuilder
    func CategoryBlock(url: String, title: String) -> some View {
        ZStack {
            URLImage(url: URL(string: url)!) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } progressView: { progress in
                ProgressView()
            }
            .frame(maxHeight: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.black.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(16)
                }
            }
        }
    }
}

#Preview {
    MainPageView()
}
