//
//  UniversityDataSource.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation

protocol UniversityDataSource{
    func getUniversityList() async throws -> Universities
}
