//
//  MyPhotosContentView.swift
//  Ego App
//
//  Created by JiaChen(: on 15/5/21.
//

import SwiftUI

struct MyPhotosContentView: View {
    
    // Creating an array of photos
    var photos = [Photo(id: "kat!!", imageName: "cat"),
                  Photo(id: "MORE KAT!!", imageName: "cat"),
                  Photo(id: "A LOT OF KAT!", imageName: "cat"),
                  Photo(id: "INFINITE KAT", imageName: "cat"),
                  Photo(id: "cat.", imageName: "cat"),
                  Photo(id: "CATTTTT", imageName: "cat"),
                  Photo(id: "THE GREATEST CAT", imageName: "cat"),
                  Photo(id: "KITKAT", imageName: "cat"),
                  Photo(id: "cation ⚛️", imageName: "cat")]
    
    var body: some View {
        
        // Essentially replicating a UICollectionView but in SwiftUI
        ScrollView {
            // Create a scrollable collection with 2 rows.
            //   Change `count` to set the number of rows
            LazyVGrid(columns: .init(repeating: GridItem(.flexible()), count: 2), content: {
                
                // Loop through photos and create `PhotoGridItem`s
                ForEach(photos) { photo in
                    PhotoGridItem(photo: photo)
                }
            })
        }
        .padding()
    }
}

struct MyPhotosContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyPhotosContentView()
    }
}
