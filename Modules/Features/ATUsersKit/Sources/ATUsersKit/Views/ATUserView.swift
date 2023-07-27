//
//  ATUserView.swift
//
//
//  Created by Alex Tudge on 27/07/2023.
//

import SwiftUI

struct ATUserView: View {
    
    @State var viewModel: ATUserViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.user.name)
                    .font(.title)
                    .foregroundStyle(.white)
                Label(viewModel.user.email, systemImage: "envelope")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Label(viewModel.user.phone, systemImage: "phone")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Label(viewModel.user.website, systemImage: "globe.europe.africa")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.indigo)
        .clipShape(.rect(cornerRadius: 20))
    }
}
