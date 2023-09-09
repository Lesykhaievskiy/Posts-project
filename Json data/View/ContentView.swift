//
//  ContentView.swift
//  Json data
//
//  Created by Олексій Гаєвський on 07.09.2023.
//

import SwiftUI




struct ContentView: View {
    @StateObject var dataController: DataController
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack{
                    ForEach(dataController.items.flatMap(\.value), id: \.postId) { item in
                        PostView(dataController: dataController, post: item)
                    }
                }

                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing){
                                    Menu {
                                        Button {
                                            dataController.SortByDate()
                                        } label: {
                                            Text("Sort by date")
                                        }
                                        Button {
                                            dataController.SortByRating()
                                        } label: {
                                            Text("Sort by rating")
                                        }
                                        
                                    } label: {
                                        Label {
                                            Text("Sort")
                                        } icon: {
                                            Image(systemName: "line.3.horizontal.decrease")
                                                .foregroundColor(.primary)
                                            
                }
                                        
      }
                                    
    }
}
                .navigationTitle("Posts")
                .task {
                    await dataController.FetchPosts()
            }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dataController: DataController())
    }
}
