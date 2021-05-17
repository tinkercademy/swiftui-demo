//
//  WrongView.swift
//  Quiz
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct WrongView: View {
    var body: some View {
        Image(systemName: "xmark.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .foregroundColor(.red)
    }
}

struct WrongView_Previews: PreviewProvider {
    static var previews: some View {
        WrongView()
    }
}
