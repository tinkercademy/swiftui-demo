//
//  LoadingContentView.swift
//  Firey Todos
//
//  Created by JiaChen(: on 16/5/21.
//

import SwiftUI

struct LoadingContentView: View {
    var body: some View {
        VStack {
            // Show loading text
            Text("Loading…")
            
            // Have that spinny loading thing
            //   Called a UIActivityIndicatorView in UIKit.
            //   The SwiftUI name seems more sensible.
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }
}

struct LoadingContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingContentView()
    }
}
