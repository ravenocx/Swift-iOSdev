//
//  MyUniversityTargetType.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation
import Moya

protocol MyUniversityTargetType : TargetType{
    var parameters : [String:Any]{
        get
    }
}

extension MyUniversityTargetType{
    var baseURL: URL{
        return URL(string: "http://universities.hipolabs.com") ?? (NSURL() as URL)
    }
    
    var parameterEncoding: Moya.ParameterEncoding{
        JSONEncoding.default
    }
    
    var task: Task{
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return[:]
    }
    
}

