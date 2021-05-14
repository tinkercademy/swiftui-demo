//
//  PhotoGridItem.swift
//  Ego App
//
//  Created by JiaChen(: on 15/5/21.
//

import SwiftUI

struct PhotoGridItem: View {
    
    var photo: Photo
    
    var body: some View {
        VStack {
            Image(uiImage: photo.image).resizable().frame(width: 50, height: 50)
            Text(photo.id)
                .multilineTextAlignment(.center)
        }
    }
}

struct PhotoGridItem_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridItem(photo: Photo(id: "cat", image: UIImage(named: "cat")!))
    }
}
