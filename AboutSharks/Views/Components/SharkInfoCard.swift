//
//  SharkInfoCard.swift
//  AboutSharks
//
//  Created by Lucas Lima on 26/02/23.
//

import SwiftUI

struct SharkInfoCard: View {
    let title: String
    let info: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text(info)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                
                Spacer()
            }
            .padding([.leading, .trailing])
        }
        .frame(width: 200, height: 150)
    }
}

struct SharkInfoCard_Previews: PreviewProvider {
    static let sharks: [Shark] = Bundle.main.decode("sharks.json")
    
    static var previews: some View {
        SharkInfoCard(title: "Mass", info: sharks[0].quickFacts.weight)
    }
}
