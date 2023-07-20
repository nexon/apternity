//
//  EntryRowView.swift
//  apternity
//
//  Created by Alberto Lagos on 19-07-23.
//

import SwiftUI

struct EntryRowView: View {
    @Binding var entry: Entry
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(.blue)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(
                    .white
                        .shadow(
                            .drop(radius: 3)
                        )
                )
                .overlay(
                    Circle()
                        .stroke(Color.gray, lineWidth: 1)
                )
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8) {
                Text(entry.name)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
                Label(entry.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)
            }
            .padding(15)
            .hSpacing(.leading)
            .background(.orange)
            .strikethrough(entry.isCompleted,
                           pattern: .solid,
                           color: .black)
        }
    }
}

struct EntryRowView_Previews: PreviewProvider {
    static var previews: some View {
        EntryRowView(entry: .constant(Entry(id: UUID(), name: "SOME INFO", isCompleted: true, creationDate: Date())))
    }
}
