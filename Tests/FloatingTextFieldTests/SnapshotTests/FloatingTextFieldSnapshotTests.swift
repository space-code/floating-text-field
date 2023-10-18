//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

@testable import FloatingTextField
import SnapshotTesting
import SwiftUI
import XCTest

// MARK: - FloatingTextFieldSnapshotTests

final class FloatingTextFieldSnapshotTests: XCTestCase {
    // MARK: Tests

    func test_thatFloatingTextFieldShowsOnlyPlaceholder_whenTextIsEmpty() {
        assertSnapshots(
            of: FloatingTextField(.constant(.empty), placeholder: .placeholder),
            as: [.image(layout: .default, traits: .light)]
        )
    }

    func test_thatFloatingTextFieldShowsCompactedPlaceholder_whenTextIsNotEmpty() {
        assertSnapshots(
            of: FloatingTextField(.constant(.text), placeholder: .placeholder),
            as: [.image(layout: .default, traits: .light)]
        )
    }

    func test_thatFloatingTextFieldShowsSecureField() {
        assertSnapshots(
            of: FloatingTextField(.constant(.text), placeholder: .placeholder)
                .isSecureTextEntry(true),
            as: [.image(layout: .default, traits: .light)]
        )
    }

    func test_thatFloatingTextFieldShowsCustomizedView() {
        assertSnapshots(
            of: FloatingTextField(.constant(.text), placeholder: .placeholder)
                .font(Font.system(size: 17.0))
                .borderWidth(2.0)
                .borderColor(.black)
                .focusedBorderColor(.black)
                .textColor(Color.black)
                .placeholderFont(Font.system(size: 14.0))
                .placeholderColor(.gray)
                .cornerRadius(12.0)
                .placeholderBottomPadding(.zero)
                .disabled(false)
                .leftView { Image(systemName: "mail.fill").foregroundColor(.gray) }
                .rightView { Image(systemName: "eye.fill").foregroundColor(.gray) },
            as: [.image(layout: .default, traits: .light)]
        )
    }

    func test_thatFloatingTextFieldShowsCustomizedView_whenCustomStyleDidSet() {
        assertSnapshots(
            of: FloatingTextField(.constant(.text), placeholder: .placeholder)
                .textFieldStyle(style: TextFieldStyle()),
            as: [.image(layout: .default, traits: .light)]
        )
    }
}

// MARK: FloatingTextFieldSnapshotTests.TextFieldStyle

private extension FloatingTextFieldSnapshotTests {
    struct TextFieldStyle: FloatingTextFieldStyle {
        func body(content: FloatingTextField) -> FloatingTextField {
            content
                .font(Font.system(size: 17.0))
                .borderWidth(1)
                .borderColor(.gray)
                .cornerRadius(8.0)
        }
    }
}

// MARK: - Constants

private extension String {
    static let empty = ""
    static let text = "name@gmail.com"
    static let placeholder = "Username"
}

private extension SwiftUISnapshotLayout {
    static let `default` = SwiftUISnapshotLayout.fixed(width: 375, height: 60)
}

private extension UITraitCollection {
    static let light = UITraitCollection(userInterfaceStyle: .light)
}
