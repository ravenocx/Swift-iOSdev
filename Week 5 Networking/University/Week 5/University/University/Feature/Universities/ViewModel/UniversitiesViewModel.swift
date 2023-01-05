//
//  UniversitiesViewModel.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import Foundation
import SwiftUI

final class UniversitiesViewModel : ObservableObject {
    private let dataSource : UniversityDataSource
    
    @Published var universities: Universities = []
    
    @Published var isLoading = false
    @Published var isError = false
    @Published var errorMessage = ""
    
    init(dataSource : UniversityDataSource = UniversityDefaultDataSource()){
        self.dataSource = dataSource
    }
    
    @MainActor func firstFetch(){
        self.isLoading = true
        self.isError = false
        self.errorMessage = ""
    }
    
    func getUniversityList() async {
        await firstFetch()
        
        do {
            let response = try await dataSource.getUniversityList()
            
            DispatchQueue.main.async {
                withAnimation {
                    self.universities = response
                    self.isLoading = false
                }
            }
        }catch{
            DispatchQueue.main.async {
                withAnimation {
                    self.isLoading = false
                    self.isError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
