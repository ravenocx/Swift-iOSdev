//
//  UniversityTargetType.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation
import Moya

enum UniversityTargetType{
    case getUniversityList
}

extension UniversityTargetType : MyUniversityTargetType{
    var parameters : [String : Any]{
        switch self{
        case .getUniversityList:
            return ["country" : "Indonesia"]
        }
    }
    
    var path : String {
        switch self {
        case .getUniversityList:
            return "/search"
        }
    }
    
    var parameterEncoding : Moya.ParameterEncoding{
        switch self {
        case .getUniversityList:
            return URLEncoding.queryString
        }
    }
    
    var task : Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var method: Moya.Method{
        switch self{
        case .getUniversityList:
            return .get
        }
    }
    
    var sampleData : Data {
        switch self{
        case .getUniversityList:
            let response = University(
                name : "Telkom University",
                country: "Indonesia",
                alphaTwoCode: "ID"
            )
            return response.toJSONData()
        }
    }
}
