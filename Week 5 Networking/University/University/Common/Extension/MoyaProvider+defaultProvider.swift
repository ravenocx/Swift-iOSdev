//
//  MoyaProvider+defaultProvider.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation
import Moya

extension MoyaProvider{
    static func defaultProvider()->MoyaProvider{
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
