//
//  NewsView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 12/04/26.
//
import SwiftUI

struct NewsView: View {
    @State var newsVM = NewsViewModel()
    var colmn:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colmn, spacing: 16){
                ForEach(newsVM.news.newsData) { sectn in
                    Section(header: Text(sectn.section)){
                        ForEach(sectn.news) { oneNews in
                            NewsGridView(oneNews: oneNews)
                        }
                    }
                    
                }
            }
        }
            
            
        .task {
            newsVM.fetchNews()
        }
    }
}



//#Preview {
//    NewsView()
//}
