//
//  View+EmptyViewModifier.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

extension View {
  func emptyState<EmptyContent>(_ isEmpty: Bool,
                                emptyContent: @escaping () -> EmptyContent) -> some View where EmptyContent: View {
    modifier(EmptyStateViewModifier(isEmpty: isEmpty, emptyContent: emptyContent))
  }
}
