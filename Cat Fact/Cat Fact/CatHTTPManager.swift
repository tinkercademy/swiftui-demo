//
//  CatHTTP.swift
//  Cat Fact
//
//  Created by JiaChen(: on 14/5/21.
//

import Foundation

class CatHTTPManager: ObservableObject {
    @Published var catFact: CatFact?
    
    func getCat() {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts/random")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            if let data = data,
               let catFact = try? jsonDecoder.decode(CatFact.self, from: data) {
                DispatchQueue.main.async {
                    self.catFact = catFact
                }
            } else {
                print("No cat fact for you :(")
            }
            
        }.resume()
        
    }
    
}
