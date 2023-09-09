//
//  PostView.swift
//  Json data
//
//  Created by Олексій Гаєвський on 08.09.2023.
//

import SwiftUI

struct PostView: View {
    @StateObject var dataController: DataController
    @State private var isTextExpand = false
    let post: Posts
    
    var body: some View {
        VStack() {
                NavigationLink {
                    DetailView(dataController: dataController, PostId: post.postId)
                } label: {
                    VStack() {
                        Text(post.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                        Text(post.preview_text)
                           .multilineTextAlignment(.leading)
                            .lineLimit(isTextExpand ? nil : 2)
                            .foregroundColor(.gray)
                    }
                }
                HStack{
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("\(post.likes_count)")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(Calendar.current.dateComponents([.day], from: Date(timeIntervalSince1970: TimeInterval(post.timeshamp)), to: Date()).day ?? 0) days ago")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Button {
                    isTextExpand.toggle()
                } label: {
                    Text(isTextExpand ? "Collapse" : "Expand")
                    
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 40.0)
                .frame(maxWidth: 350)
                .background(Color(red: 0.289, green: 0.319, blue: 0.357))
                .cornerRadius(10)
                .padding(.bottom, 30)
                Divider()
                
                
            }
            
        }
        
    }

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(dataController: DataController(), post: Posts(postId: 123, timeshamp:         1694080963, title: "Some title for test", preview_text: "My name is Oleksii Haievskyi, i'm 18 years student of National University of Lviv. I am studying at Bachelor of Applied Mathematics, Computer Science Major. Now i am searching my first job, and i really want to become an ios developer. Software development for mobile devices has always been a strong passion of mine. I am ready to study a lot and hard to achieve my goal! Thank you for your time. ", likes_count: 123123))
    }
}
