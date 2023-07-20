//
//  Entry.swift
//  apternity
//
//  Created by Alberto Lagos on 19-07-23.
//

import Foundation

struct Entry: Identifiable {
    let id: UUID
    let name: String
    let isCompleted: Bool
    let creationDate: Date
}
