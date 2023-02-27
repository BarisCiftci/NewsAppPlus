//
//  FavoriteButton.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 21/02/2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Toggle(
                isOn: $isSet,
                label: {
                    Text("Favorites")
                })
        .padding(.horizontal)
        .toggleStyle(SwitchToggleStyle(tint: Color.green))

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
    }
}
