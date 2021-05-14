//
//  MyPhotosContentView.swift
//  Ego App
//
//  Created by JiaChen(: on 15/5/21.
//

import SwiftUI

struct MyPhotosContentView: View {
    
    // Creating an array of photos
    @State var photos = [Photo(id: "kat!!", image: UIImage(named: "cat")!),
                         Photo(id: "MORE KAT!!", image: UIImage(named: "cat")!),
                         Photo(id: "A LOT OF KAT!", image: UIImage(named: "cat")!),
                         Photo(id: "INFINITE KAT", image: UIImage(named: "cat")!),
                         Photo(id: "cat.", image: UIImage(named: "cat")!),
                         Photo(id: "CATTTTT", image: UIImage(named: "cat")!),
                         Photo(id: "THE GREATEST CAT", image: UIImage(named: "cat")!),
                         Photo(id: "KITKAT", image: UIImage(named: "cat")!),
                         Photo(id: "cation ⚛️", image: UIImage(named: "cat")!)]
    
    @State private var showingImagePicker = false
    @State var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("It's me")
            .navigationBarItems(trailing: Button(action: {
                showingImagePicker = true
            }) {
                Image(systemName: "plus")
            })
        }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        photos.append(Photo(id: Date().description, image: inputImage))
        
        self.inputImage = nil
    }
}

struct MyPhotosContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyPhotosContentView()
    }
}
