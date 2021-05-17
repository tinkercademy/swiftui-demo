//
//  CorrectView.swift
//  Quiz
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct CorrectView: View {
    var body: some View {
        Image(systemName: "checkmark.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .foregroundColor(.green)
    }
}

struct CorrectView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectView()
    }
}
