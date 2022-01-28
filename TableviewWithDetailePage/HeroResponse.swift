//
//  HeroResponse.swift
//  TableviewWithDetailePage
//
//  Created by Suneetha Ragupatula on 1/25/22.
//

import Foundation

struct HeroStates: Codable {
    
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
