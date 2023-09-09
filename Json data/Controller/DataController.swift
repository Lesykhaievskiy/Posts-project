//
//  Controller.swift
//  Json data
//
//  Created by Олексій Гаєвський on 07.09.2023.
//

import Foundation

class DataController: ObservableObject{
    @Published var items = [String: [Posts]]()
    @Published var itemsDetailed: DetailedPostFromResponse? = nil


    
    func FetchPosts() async {
        guard let url = URL(string:"https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json") else {
            print("ERROR")
            return
        }
        
        Task {
            do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        let decodedResponse = try JSONDecoder().decode([String: [Posts]].self, from: data)
                        items = decodedResponse
                    } catch {
                        print("Error: \(error)")
                    }
                }
        
    }
  
    func FetchPostById(id: Int) async {
        guard let url = URL(string:"https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json") else {
            print("ERROR")
            return
        }
        
        Task {
            do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let decodedResponse = try? JSONDecoder().decode(DetailedPostFromResponse.self, from: data) {
                        
                        itemsDetailed = decodedResponse
                    }
                
                    } catch {
                        print("Error: \(error)")
                    }
                }
    }
    
    func SortByDate(){
        items = items.mapValues{ posts in
            return posts.sorted(by: {$0.timeshamp < $1.timeshamp})
        }
    }
    
    
    func SortByRating(){
        items = items.mapValues{ posts in
            return posts.sorted(by: {$0.likes_count > $1.likes_count})
        }
    }
    
    func formatTimeSince1970(_ timestamp: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM YYYY"
        
        return dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
    }

    
   
    
}
