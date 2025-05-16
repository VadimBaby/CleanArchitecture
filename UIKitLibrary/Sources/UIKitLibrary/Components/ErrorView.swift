//
//  SwiftUIView.swift
//  UIKitLibrary
//
//  Created by Вадим Мартыненко on 16.05.2025.
//

import SwiftUI

public struct ErrorView: View {
    private let error: Error
    
    public init(error: Error) {
        self.error = error
    }
    
    public var body: some View {
        Text(error.localizedDescription)
            .font(.title3)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ErrorView(error: URLError(.badServerResponse))
}
