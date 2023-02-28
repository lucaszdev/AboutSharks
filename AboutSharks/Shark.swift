//
//  Shark.swift
//  AboutSharks
//
//  Created by Lucas Lima on 24/02/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Shark
struct Shark: Codable, Identifiable {
    let id: Int
    let name: String
    let alsoKnownAs: [String]
    let gallery: [String]
    let quickFacts: QuickFacts
    let about: String
    let taxonomy: Taxonomy

    enum CodingKeys: String, CodingKey {
        case id, name
        case alsoKnownAs = "also_known_as"
        case gallery
        case quickFacts = "quick_facts"
        case about, taxonomy
    }
}

// MARK: - QuickFacts
struct QuickFacts: Codable {
    let eats, length, weight, speed: String
    let lifespan: Int
}

// MARK: - Taxonomy
struct Taxonomy: Codable {
    let kingdom, phylum, taxonomyClass, order: String
    let family, genus, scientificName: String

    enum CodingKeys: String, CodingKey {
        case kingdom, phylum
        case taxonomyClass = "class"
        case order, family, genus
        case scientificName = "scientific_name"
    }
}
