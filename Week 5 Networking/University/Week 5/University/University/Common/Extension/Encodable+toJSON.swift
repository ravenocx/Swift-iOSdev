//
//  Encodable+toJSON.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation

extension Encodable{
    func toJSON()->[String: Any]{
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
              let json = dictionary as? [String:Any] else {
            return[:]
        }
        return json
    }
    
    func toJSONData() -> Data {
        guard let data = try? JSONEncoder().encode(self) else {
            return Data()
        }
        return data
    }
}
