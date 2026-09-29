//
//  TableRow.swift
//  Adequate Wallpapers
//
//  Created by Tjark Scheele on 29.09.26.
//
import SwiftUI
import UniformTypeIdentifiers

struct TableRow: View {
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var showFileImporter: Bool = false
    
    var body: some View {
        HStack {
            TextField("DD.MM.YYYY", text: $startDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize(horizontal: true , vertical: true)
                .frame(width: 100)
            Text("-")
            TextField("DD.MM.YYYY", text: $endDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize(horizontal: true , vertical: true)
                .frame(width: 100)
            Button("Choose file") {
                showFileImporter = true
            }
            .fileImporter(
               isPresented: $showFileImporter,
               allowedContentTypes: [.pdf, .jpeg, .png],
               allowsMultipleSelection: true
           ) { result in
               switch result {
               case .success(let files):
                   files.forEach { file in
                       // gain access to the directory
                       let gotAccess = file.startAccessingSecurityScopedResource()
                       if !gotAccess { return }
                       // access the directory URL
                       // (read templates in the directory, make a bookmark, etc.)
                       // saveurl()
                       // release access
                       file.stopAccessingSecurityScopedResource()
                   }
               case .failure(let error):
                   print(error)
               }
           }
        }
    }
}
