//
//  NewsGrid.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 12/04/26.
//
import SwiftUI

struct NewsGridView: View {
    let oneNews: NewsDetail
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: oneNews.newsImage))
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipped()
                
            Text(oneNews.sectionType)
            Text(oneNews.newsUpdate)
        }
        .border(Color.black)
    }
}
