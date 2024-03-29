//
//  ContentView.swift
//  iOS-Demo-SwiftUI-Enum
//
//  Created by Rob Lokhorst on 05/06/2019.
//  Copyright © 2019 Rob Lokhorst. All rights reserved.
//

import SwiftUI

enum Row: Identifiable {
  case text(TextRow)
  case image(name: String, width: CGFloat, height: CGFloat)
  case separator

  var id: UUID { return UUID() }
}

enum TextRow {
  case heading(String)
  case body(String)
}

struct ContentView: View {
  let rows: [Row] = [
    .text(.heading("Solving Enums")),
    .text(.body("in SwiftUI")),
    .separator,
    .image(name: "image", width: 42, height: 42),
  ]

  var body: some View {
    return Group {
      List(rows) { row in
        RowView(row: row)
      }
    }
  }
}

struct RowView: View {
  let row: Row

  var body: some View {
    Row.Switch(
      value: row,
      text: { TextRowView(textRow: $0) },
      image: { (name, width, height) in
        Image(name)
          .resizable()
          .frame(width: width, height: height, alignment: .center)
      },
      separator: { Divider() }
    )
  }
}

struct TextRowView: View {
  let textRow: TextRow

  var body: some View {
    TextRow.Switch(
      value: textRow,
      heading: { Text($0).font(.headline) },
      body: { Text($0).font(.body) }
    )
  }
}
