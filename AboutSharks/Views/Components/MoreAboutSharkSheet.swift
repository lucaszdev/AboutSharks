//
//  MoreAboutSharkSheet.swift
//  AboutSharks
//
//  Created by Lucas Lima on 27/02/23.
//

import SwiftUI

struct MoreAboutSharkSheet: View {
    let sharkName: String
    let sharkAbout: String
    
    var body: some View {
        NavigationStack {
            Text(sharkAbout)
                .padding()
                .navigationTitle(sharkName)
                .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
        }
    }
}

struct MoreAboutSharkSheet_Previews: PreviewProvider {
    static let sharks: [Shark] = Bundle.main.decode("sharks.json")
    
    static var previews: some View {
        MoreAboutSharkSheet(sharkName: sharks[0].name, sharkAbout: sharks[0].about)
    }
}
