//
//  Model.swift
//  Json data
//
//  Created by Олексій Гаєвський on 07.09.2023.
//

import Foundation

struct Posts: Codable{
    var postId: Int
    var timeshamp: Int
    var title: String
    var preview_text: String
    var likes_count: Int

}

struct DetailedPost: Codable{
    var postId: Int
    var timeshamp: Int
    var title: String
    var likes_count: Int
    var text: String
    var postImage: String
}

struct DetailedPostFromResponse: Codable {
    var post: DetailedPost
}

struct PostViewState {
    var isTextLimited = false
}
