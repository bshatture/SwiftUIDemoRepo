//
//  PhotoGallary.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 10/03/26.
//
import SwiftUI

struct PhotoGallary: View {
    
    @Namespace private var photoTransition
    let photos = [
        Photo(id: 1, imageName: "https://picsum.photos/id/1/400", title: "Coder"),
        Photo(id: 2, imageName: "https://picsum.photos/id/2/400", title: "Coffe Coder"),
        Photo(id: 3, imageName: "https://picsum.photos/id/3/400", title: "Mobile Engineer"),
        Photo(id: 10, imageName: "https://picsum.photos/id/10/400", title: "Forest Path"),
        Photo(id: 20, imageName: "https://picsum.photos/id/20/400", title: "Pretty Desk"),
        Photo(id: 30, imageName: "https://picsum.photos/id/30/400", title: "Coffee Mug")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 8) {
                    ForEach(photos, id: \.id) { photo in
                        NavigationLink(value: photo) {
                            AsyncImage(url: URL(string: photo.imageName)) { image in
                                image
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                            }
                        }
                        .matchedTransitionSource(id: photo.id, in: photoTransition)
                    }
                }
                .padding()
            }
            .navigationTitle("Photos")
            .navigationDestination(for: Photo.self) { photo in
                PhotoDetailView(photo: photo)
                    .navigationTransition(.zoom(sourceID: photo.id, in: photoTransition))
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}



struct Photo: Identifiable, Hashable {
    var id: Int
    var imageName: String
    var title: String
}



#Preview {
    PhotoGallary()
}
