//
//  University.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation

struct University : Codable {
    let name : String?
    let country : String?
    let alphaTwoCode : String?
    
    enum CodingKeys : String, CodingKey {
        case name,country
        case alphaTwoCode = "alpha_two_code"
    }
}

typealias Universities = [University]
