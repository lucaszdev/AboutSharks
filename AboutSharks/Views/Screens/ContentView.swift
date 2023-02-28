//
//  ContentView.swift
//  AboutSharks
//
//  Created by Lucas Lima on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    let sharks: [Shark] = Bundle.main.decode("sharks.json")
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(sharks) { shark in
                    NavigationLink {
                        SharkDetails(shark: shark)
                    } label: {
                        SharkCard(shark: shark)
                    }
                }
            }
            .navigationTitle("AboutSharks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
