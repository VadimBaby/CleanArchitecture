//
//  SwiftUIView.swift
//  UIKitLibrary
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI

private struct Constants {
    static let avatarSize: CGFloat = 150
    static let avatarCornerRadius: CGFloat = 15
    static let containerCornerRadius: CGFloat = 15
}

public struct CharacterCardView: View {
    private let name: String
    private let status: String
    private let species: String
    private let gender: String
    private let imageURL: URL?
    
    public init(
        name: String,
        status: String,
        species: String,
        gender: String,
        imageURL: URL?
    ) {
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.imageURL = imageURL
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: Constants.avatarSize,
                        height: Constants.avatarSize
                    )
                    .clipShape(
                        .rect(cornerRadius: Constants.avatarCornerRadius)
                    )
            } placeholder: {
                ProgressView()
                    .frame(
                        width: Constants.avatarSize,
                        height: Constants.avatarSize,
                        alignment: .center
                    )
            }

            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .fontWeight(.medium)
                
                Group {
                    Text("Status: " + status)
                    Text("Species: " + species)
                    Text("Gender: " + gender)
                }
                .font(.callout)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.systemBackground)
        .clipShape(.rect(cornerRadius: Constants.containerCornerRadius))
    }
}

#Preview {
    CharacterCardView(name: "Rick", status: "Alive", species: "Human", gender: "Male", imageURL: .init(string: "https://rickandmortyapi.com/api/character/avatar/361.jpeg"))
        .padding()
}
