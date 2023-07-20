//
//  EmptyStateViewModifier.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct EmptyStateViewModifier<EmptyContent>: ViewModifier where EmptyContent: View {
  var isEmpty: Bool
  let emptyContent: () -> EmptyContent
  
  func body(content: Content) -> some View {
    if isEmpty {
      emptyContent()
    }
    else {
      content
    }
  }
}
