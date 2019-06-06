// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// MARK - Generate SwiftUI Views for Enums

import SwiftUI

internal extension Row {
  struct Switch<T1: View, T2: View, T3: View>: View {
    var body: TupleView<(T1?, T2?, T3?)>

    init(
      value: Row,
      text: @escaping (String) -> T1, 
      image: @escaping (String, CGFloat, CGFloat) -> T2, 
      separator: @escaping () -> T3
    ) {
      var textView: T1?
      var imageView: T2?
      var separatorView: T3?

      switch value {
      case .text(let p1):
        textView = text(p1)
      case .image(let p1, let p2, let p3):
        imageView = image(p1, p2, p3)
      case .separator:
        separatorView = separator()
      }

      body = TupleView((textView, imageView, separatorView))
    }
  }
}
internal extension Sjaak {
  struct Switch<T1: View, T2: View, T3: View, T4: View>: View {
    var body: TupleView<(T1?, T2?, T3?, T4?)>

    init(
      value: Sjaak,
      henk: @escaping () -> T1, 
      karel: @escaping (Int) -> T2, 
      kees: @escaping ([(x: Int, y: CGFloat)]) -> T3, 
      jaap: @escaping () -> T4
    ) {
      var henkView: T1?
      var karelView: T2?
      var keesView: T3?
      var jaapView: T4?

      switch value {
      case .henk:
        henkView = henk()
      case .karel(let p1):
        karelView = karel(p1)
      case .kees(let p1):
        keesView = kees(p1)
      case .jaap:
        jaapView = jaap()
      }

      body = TupleView((henkView, karelView, keesView, jaapView))
    }
  }
}
