//
//  NewsViewModel.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 12/04/26.
//
import SwiftUI


@Observable
class NewsViewModel{
    var news: NewsList
    
    init(news: NewsList = NewsList(newsData: [])) {
        self.news = news
    }
    
    func fetchNews(){
        let sportsNewsObj = SportsNews()
        do {
            let data = sportsNewsObj.sportsNews.data(using: .utf8)!
            let res = try JSONDecoder().decode(NewsList.self, from: data)
            
            self.news = res
            print("\(self.news)")
        }catch{
            print("Found error in conversion : \(error)")
        }
    }
}
