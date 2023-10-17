//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

@testable import FloatingTextField
import SwiftUI
import XCTest

// MARK: - FloatingTextFieldTests

final class FloatingTextFieldTests: XCTestCase {
    // MARK: Properties

    private var sut: FloatingTextField!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        sut = FloatingTextField(
            .constant(.text),
            placeholder: .placeholder
        )
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatFloatingTextFieldChangesForegroundColor_whenTitleColorDidSet() {
        // when
        _ = sut.titleColor(.red)

        // then
        XCTAssertEqual(sut.configuration.titleColor, .red)
    }

    func test_thatFloatingTextFieldChangesSecureEntry_whenSecureEntryDidSet() {
        // when
        _ = sut.secureField(true)

        // then
        XCTAssertTrue(sut.configuration.isSecureEntry)
    }

    func test_thatFloatingTextFieldChangesPlaceholderColor_whenPlaceholderColorDidSet() {
        // when
        _ = sut.placeholderColor(.red)

        // then
        XCTAssertEqual(sut.configuration.placeholderColor, .red)
    }

    func test_thatFloatingTextFieldChangesPlaceholderFont_whenPlaceholderFontDidSet() {
        // given
        let font = Font.system(size: 17.0)

        // when
        _ = sut.placeholderFont(font)

        // then
        XCTAssertEqual(sut.configuration.placeholderFont, font)
    }

    func test_thatFloatingTextFieldChangesFont_whenFontDidSet() {
        // given
        let font = Font.system(size: 17.0)

        // when
        _ = sut.textFont(font)

        // then
        XCTAssertEqual(sut.configuration.font, font)
    }

    func test_thatFloatingTextFieldChangesBorderWidth_whenBorderWidthDidSet() {
        // given
        let borderWidth: CGFloat = 1

        // when
        _ = sut.borderWidth(borderWidth)

        // then
        XCTAssertEqual(sut.configuration.borderWidth, borderWidth)
    }

    func test_thatFloatingTextFieldChangesBorderColor_whenBorderColorDidSet() {
        // when
        _ = sut.borderColor(.red)

        // then
        XCTAssertEqual(sut.configuration.borderColor, .red)
    }

    func test_thatFloatingTextFieldChangesFocusedBorderColor_whenFocusedBorderColorDidSet() {
        // when
        _ = sut.focusedBorderColor(.red)

        // then
        XCTAssertEqual(sut.configuration.focusedBorderColor, .red)
    }

    func test_thatFloatingTextFieldChangesBorderCornerRadius_whenFocusedBorderCornerRadiusDidSet() {
        // given
        let cornerRadius: CGFloat = 12

        // when
        _ = sut.borderCornerRadius(cornerRadius)

        // then
        XCTAssertEqual(sut.configuration.borderCornerRadius, cornerRadius)
    }

    func test_thatFloatingTextFieldChangesPlaceholderBottomPadding_whenPlaceholderBottomPaddingDidSet() {
        // given
        let padding: CGFloat = 12

        // when
        _ = sut.placeholderBottomPadding(padding)

        // then
        XCTAssertEqual(sut.configuration.placeholderBottomPadding, padding)
    }
}

// MARK: - Constants

private extension String {
    static let text = "text"
    static let placeholder = "placeholder"
}
