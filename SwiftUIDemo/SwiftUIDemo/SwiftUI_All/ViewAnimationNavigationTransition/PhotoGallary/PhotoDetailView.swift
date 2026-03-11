//
//  Untitled.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 10/03/26.
//

import SwiftUI

struct PhotoDetailView: View {
    
    let photo: Photo
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: photo.imageName))
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipped()
        }
        
        VStack(spacing: 16){
            Text("\(photo.title)")
                .font(.largeTitle)
                .navigationTitle(photo.title)
            Text("\(photo.imageName)")
        }
    }
}
