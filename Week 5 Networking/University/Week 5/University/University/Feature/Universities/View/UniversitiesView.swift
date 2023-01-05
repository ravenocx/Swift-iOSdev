//
//  UniversitiesView.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import SwiftUI

struct UniversitiesView: View {
    @ObservedObject var viewModel = UniversitiesViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack{
            VStack{
                if viewModel.isError{
                    Text(viewModel.errorMessage)
                    
                    Button{
                        Task.init{
                            await viewModel.getUniversityList()
                        }
                    }label: {
                        Text("Try Again")
                    }.buttonStyle(.bordered)
                    
                }else {
                    List(viewModel.universities, id: \.name){
                        university in NavigationLink {
                            Text(university.name ?? "")
                                .navigationTitle(Text(university.name ?? ""))
                                .navigationBarTitleDisplayMode(.inline)
                                .onAppear{
                                    let newUni = UniversityModel(context : viewContext )
                                    newUni.name = university.name
                                    newUni.country = university.country
                                    do{
                                        try viewContext.save()
                                    }catch{
                                        let nsError = error as NSError
                                        debugPrint(nsError)
                                    }
                                }
                        }label: {
                            Text(university.name ?? "")
                        }
                    }
                    .refreshable {
                        Task.init {
                            await viewModel.getUniversityList()
                        }
                    }
                }
            }
            if viewModel.isLoading{
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding(36)
                    .background(Color.white)
                    .cornerRadius(12)
            }
        }
        .navigationTitle(Text("University List"))
        .onAppear{
            if viewModel.universities.isEmpty{
                Task.init{
                    await viewModel.getUniversityList()
                }
            }
        }
    }
}

struct UniversitiesView_Previews: PreviewProvider {
    static var previews: some View {
        UniversitiesView()
    }
}
