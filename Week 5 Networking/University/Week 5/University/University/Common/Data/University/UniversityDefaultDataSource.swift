//
//  UniversityDefaultDataSource.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation
import Moya

final class UniversityDefaultDataSource : UniversityDataSource{
    private let provider : MoyaProvider<UniversityTargetType>
    
    init(provider : MoyaProvider<UniversityTargetType> = .defaultProvider()){
        self.provider = provider
    }
    
    func getUniversityList() async throws -> Universities {
        try await self.provider.requestAsync(.getUniversityList, model: Universities.self)
    }
}
