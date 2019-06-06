// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// MARK - Generate SwiftUI Views for Enums

import SwiftUI

internal extension Row {
  struct Switch<T1: View, T2: View, T3: View>: View {
    var body: TupleView<(T1?, T2?, T3?)>

    init(
      value: Row,
      text p1: @escaping (TextRow) -> T1, 
      image p2: @escaping (String, CGFloat, CGFloat) -> T2, 
      separator p3: @escaping () -> T3
    ) {
      var v1: T1?
      var v2: T2?
      var v3: T3?

      switch value {
      case .text(let f1):
        v1 = p1(f1)
      case .image(let f1, let f2, let f3):
        v2 = p2(f1, f2, f3)
      case .separator:
        v3 = p3()
      }

      body = TupleView((v1, v2, v3))
    }
  }
}

internal extension TextRow {
  struct Switch<T1: View, T2: View>: View {
    var body: TupleView<(T1?, T2?)>

    init(
      value: TextRow,
      heading p1: @escaping (String) -> T1, 
      body p2: @escaping (String) -> T2
    ) {
      var v1: T1?
      var v2: T2?

      switch value {
      case .heading(let f1):
        v1 = p1(f1)
      case .body(let f1):
        v2 = p2(f1)
      }

      body = TupleView((v1, v2))
    }
  }
}

