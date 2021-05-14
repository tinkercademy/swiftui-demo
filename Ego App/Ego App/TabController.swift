//
//  TabController.swift
//  Ego App
//
//  Created by JiaChen(: on 15/5/21.
//

import SwiftUI

struct TabController: View {
    var body: some View {
        
        // Configuring the tab view and referencing the 2 views
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("About Me")
                }
            MyPhotosContentView()
                .tabItem {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("My Photos")
                }
        }
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
    }
}
