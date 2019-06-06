//
//  ContentView.swift
//  iOS-Demo-SwiftUI-Enum
//
//  Created by Rob Lokhorst on 05/06/2019.
//  Copyright © 2019 Rob Lokhorst. All rights reserved.
//

import SwiftUI

enum Sjaak {
  case henk
  case karel(leeftijd: Int)
  case kees(dingen: [(x: Int, y: CGFloat)])
  case jaap
}

enum Row: Identifiable {
  case text(String)
  case image(name: String, width: CGFloat, height: CGFloat)
  case separator

  var id: UUID { return UUID() }
}

struct ContentView: View {

  var rows: [Row] = [
    .text("Hi"),
    .text("Bye"),
    .separator,
    .image(name: "image", width: 42, height: 42),
  ]

  var sjaak = Sjaak.kees(dingen: [(x: 1, y: 52.0)])

  var body: some View {
    return Group {
      List(rows) { row in
        RowSwitch(
          row: row,
          text: { label in
            Text(label)
          }, image: { (name, width, height) in
            Image(name)
              .resizable()
              .frame(width: width, height: height, alignment: .center)
          }, separator: {
            Divider()
          }
        )
      }

      Sjaak.Switch(
        value: sjaak,
        henk: { Text("Henk") },
        karel: { Image("\($0)") },
        kees: { Text("\($0.first!.x) \($0.first!.y)") },
        jaap: { Text("Jaap") }
      )
    }
  }
}

struct RowSwitch<TextView: View, ImageView: View, SeparatorView: View>: View {
  var body: TupleView<(TextView?, TupleView<(ImageView?, SeparatorView?)>)>

  init(
    row: Row,
    text: @escaping (String) -> TextView,
    image: @escaping (String, CGFloat, CGFloat) -> ImageView,
    separator: @escaping () -> SeparatorView)
  {
    var textView: TextView?
    var imageView: ImageView?
    var separatorView: SeparatorView?

    switch row {
    case .text(let label):
      textView = text(label)
    case .image(let name, let width, let height):
      imageView = image(name, width, height)
    case .separator:
      separatorView = separator()
    }

    body = TupleView((textView, TupleView((imageView, separatorView))))
  }
}
