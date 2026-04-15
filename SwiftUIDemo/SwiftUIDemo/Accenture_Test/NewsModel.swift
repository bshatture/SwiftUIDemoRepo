//
//  NewsModel.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 12/04/26.
//

import Foundation

struct NewsList: Decodable, Identifiable {
    var id: UUID = UUID()
    var newsData: [News]
    
    enum CodingKeys: String, CodingKey{
        case newsData
    }
}

struct News: Decodable, Identifiable {
    var id: UUID = UUID()
    let section: String
    let news: [NewsDetail]
    
    enum CodingKeys: String, CodingKey {
        case section
        case news
    }
}

struct NewsDetail: Decodable, Identifiable {
    var id: UUID = UUID()
    let sectionType: String
    let newsUpdate: String
    let newsImage: String
    
    enum CodingKeys: String, CodingKey {
        case sectionType
        case newsUpdate
        case newsImage
    }
}

struct SportsNews {
    var sportsNews = """
        {
          "newsData": [
            {
              "section": "Sports",
              "news": [
                {
                  "sectionType": "cricket",
                  "newsUpdate": "IPL begins from today",
                  "newsImage": "https://picsum.photos/1000"
                },
                {
                  "sectionType": "football",
                  "newsUpdate": "football world cup!",
                  "newsImage": "https://picsum.photos/300"
                }
              ]
            },
            {
              "section": "Finance",
              "news": [
                {
                  "sectionType": "budget",
                  "newsUpdate": "Budget announced",
                  "newsImage": "https://picsum.photos/100"
                },
                {
                  "sectionType": "share market",
                  "newsUpdate": "Share market up",
                  "newsImage": "https://picsum.photos/1001"
                }
              ]
            }
          ]
        }
        """
}



