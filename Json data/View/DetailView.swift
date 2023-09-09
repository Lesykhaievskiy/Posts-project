//
//  DetailView.swift
//  Json data
//
//  Created by Олексій Гаєвський on 07.09.2023.
//

import SwiftUI
struct DetailView: View {
    @ObservedObject var dataController: DataController
    var PostId: Int
    
    var body: some View {
        
        
        GeometryReader { geometry in
            NavigationView {
                    ScrollView {
                        VStack {
                            if let post = dataController.itemsDetailed {
                                   AsyncImage(url: URL(string: post.post.postImage)) { image in image
                                           .resizable()
                                           .scaledToFill()
                                           
                                   } placeholder: {
                                       ProgressView()
                                               }
                                Text(post.post.title)
                                    .font(.title2)
                                    .bold()
                                    .padding(.bottom, 30.0)
                         
                                Text(post.post.text)
                                    .font(.headline)
                                    .padding()
                                HStack{
                                    Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                    Text("\(post.post.likes_count)")
                                    Spacer()
                                    
                                    Text("\(dataController.formatTimeSince1970(TimeInterval(post.post.timeshamp)))")
                                }
                            
                            } else {
                                Text("Error during fetch")
                            }
                            
                        }
                        .task {
                            await dataController.FetchPostById(id: PostId)
                    }
                        .navigationBarTitle("", displayMode: .inline)
                                 .toolbar {
                                     ToolbarItem(placement: .principal) {
                                         Text("More info")
                                             .font(.headline)
                                             .foregroundColor(.primary)
                                             .padding()
                                     }
                                 }
                    }
            }
        }
       
       
    }
}

        

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dataController = DataController()
        return DetailView( dataController: dataController, PostId: 112)
    }
}
