//
//  SharkCard.swift
//  AboutSharks
//
//  Created by Lucas Lima on 25/02/23.
//

import SwiftUI

struct SharkCard: View {
    let shark: Shark
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: shark.gallery[0])) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 200)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        GeometryReader { geometry in
                            Color.clear
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.black)
                                        .opacity(0.10)
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                                )
                        }
                    )
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.5)
                    ProgressView()
                }
                .frame(width: 400, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            VStack {
                Text(shark.name)
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Text(shark.taxonomy.scientificName)
                    .font(.body.italic())
                    .foregroundColor(.white)
            }
            .padding([.leading, .bottom])
            .frame(width: 400, height: 200, alignment: .bottomLeading)
        }
    }
}

struct SharkCard_Previews: PreviewProvider {
    static let sharks: [Shark] = Bundle.main.decode("sharks.json")
    
    static var previews: some View {
        SharkCard(shark: sharks[0])
    }
}
