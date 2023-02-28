//
//  SharkDetails.swift
//  AboutSharks
//
//  Created by Lucas Lima on 25/02/23.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss

    @Binding var sharkImage: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .padding()
                }
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: sharkImage)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 500, maxHeight: 300)
            
            Spacer()
        }
    }
}

struct SharkDetails: View {
    let shark: Shark
    
    @State private var isPresented = false
    @State private var sharkImageClicked = ""
    @State private var showMoreAbout = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: shark.gallery[0])) { image in
                    image.resizable()
                } placeholder: {
                    ZStack {
                        Color.gray.opacity(0.5)
                        ProgressView()
                    }
                    .frame(width: 500, height: 300)
                }
                .frame(maxWidth: 500, maxHeight: 300)
                .onTapGesture {
                    sharkImageClicked = shark.gallery[0]
                    isPresented.toggle()
                }
    
                VStack(alignment: .leading) {
                    Text("About the Specie")
                        .font(.title.bold())
                        .padding([.top, .bottom], 5)

                    VStack(alignment: .leading, spacing: 10) {
                        Text(shark.about[shark.about.startIndex..<shark.about.index(shark.about.startIndex, offsetBy: 300)] + "...")
                         Button("Click here to see more about") {
                             withAnimation {
                                 showMoreAbout.toggle()
                             }
                         }
                    }
                    
                    Text("Quick Facts")
                        .font(.title.bold())
                        .padding([.top, .bottom], 5)
                }
                .padding([.leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        SharkInfoCard(title: "Mass", info: shark.quickFacts.weight)
                        SharkInfoCard(title: "Length", info: shark.quickFacts.length)
                        SharkInfoCard(title: "Eats", info: shark.quickFacts.eats)
                        SharkInfoCard(title: "Speed", info: shark.quickFacts.speed)
                        SharkInfoCard(title: "Lifespan", info: String(shark.quickFacts.lifespan) + " years")
                    }
                    .padding([.leading, .trailing])
                }
                
                VStack(alignment: .leading) {
                    Text("Scientific Classification")
                        .font(.title.bold())
                        .padding([.top, .bottom], 5)
                }
                .padding([.leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        SharkInfoCard(title: "Scientific Name", info: shark.taxonomy.scientificName)
                        SharkInfoCard(title: "Order", info: shark.taxonomy.order)
                        SharkInfoCard(title: "Kingdom", info: shark.taxonomy.kingdom)
                        SharkInfoCard(title: "Phylum", info: shark.taxonomy.phylum)
                        SharkInfoCard(title: "Class", info: shark.taxonomy.taxonomyClass)
                        SharkInfoCard(title: "Family", info: shark.taxonomy.family)
                        SharkInfoCard(title: "Genus", info: shark.taxonomy.genus)
                    }
                    .padding([.leading, .trailing])
                }
                
                VStack {
                    Text("Gallery")
                        .font(.title.bold())
                        .padding([.top, .bottom], 5)
                }
                .padding([.leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(shark.gallery.dropFirst(), id: \.self) { sharkImage in
                            AsyncImage(url: URL(string: sharkImage)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 350, height: 200)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .onTapGesture {
                                        sharkImageClicked = sharkImage
                                        isPresented.toggle()
                                    }
                            } placeholder: {
                                ZStack {
                                    Color.gray.opacity(0.5)
                                    ProgressView()
                                }
                                .frame(width: 350, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                }
            }
        }
        .navigationTitle(shark.name)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresented) {
            FullScreenModalView(sharkImage: $sharkImageClicked)
        }
        .sheet(isPresented: $showMoreAbout) {
            MoreAboutSharkSheet(sharkName: shark.name, sharkAbout: shark.about)
        }
    }
}

struct SharkDetails_Previews: PreviewProvider {
    static let sharks: [Shark] = Bundle.main.decode("sharks.json")
    
    static var previews: some View {
        SharkDetails(shark: sharks[0])
    }
}
