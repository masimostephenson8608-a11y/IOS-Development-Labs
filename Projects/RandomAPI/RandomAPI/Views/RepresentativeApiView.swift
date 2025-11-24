//
//  RepresentativeApiView.swift
//  RandomAPI
//
//  Created by Masimo Stephenson on 11/20/25.
//

import SwiftUI

struct RepresentativeApiView: View {
    @State var apiController: RepresentativeApiController
    @State var reps: [Representative]?
    @State var textZip = ""
    var body: some View {
        VStack {
            TextField("Zip Code:", text: $textZip) {
                Task {
                    reps = try await apiController.fetchRepresentatives(zip: textZip)
                }
            }
            if let reps {
                ForEach(reps) { rep in
                    itemCellView(rep: rep)
                }
            }
        }
    }
    
    func itemCellView(rep: Representative) -> some View {
        var results: some View {
            ZStack {
                Rectangle()//.frame(width: 100, height: 115)
                VStack {
                    Text("""
                    \(rep.name)
                    \(rep.party)
                    \(rep.state)
                    \(rep.phone)
                    \(rep.district)
                    \(rep.office)
                    \(rep.link)
                    """).foregroundStyle(.white)
                }
            }
        }
        return results
    }
}



#Preview {
    RepresentativeApiView(apiController: RepresentativeApiController())
}
