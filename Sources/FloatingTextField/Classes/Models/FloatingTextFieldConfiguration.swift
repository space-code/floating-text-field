//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import SwiftUI

/// A configuration class for defining the appearance and behavior of a `FloatingTextField`.
final class FloatingTextFieldConfiguration: ObservableObject {
    // MARK: Properties

    /// Determines whether the text input is treated as a secure entry (e.g., for passwords).
    @Published var isSecureTextEntry: Bool

    /// The color of the title when the text field is in its default state.
    @Published var titleColor: Color

    /// The color of the placeholder text.
    @Published var placeholderColor: Color

    /// The font used for the placeholder text.
    @Published var placeholderFont: Font

    /// The font used for the text input.
    @Published var font: Font

    /// The width of the text field's border.
    @Published var borderWidth: CGFloat

    /// The color of the text field's border.
    @Published var borderColor: Color

    /// The color of the text field's border when it is focused.
    @Published var focusedBorderColor: Color

    /// The corner radius of the text field's border.
    @Published var cornerRadius: CGFloat

    /// The amount of padding beneath the placeholder text.
    @Published var placeholderBottomPadding: CGFloat

    /// A flag to disable user interaction with the text field.
    @Published var disabled: Bool

    /// A custom view to display on the left side of the text field.
    @Published var leftView: AnyView?

    /// A custom view to display on the right side of the text field.
    @Published var rightView: AnyView?

    // MARK: Initialization

    init(
        isSecureTextEntry: Bool = false,
        titleColor: Color = .gray,
        placeholderColor: Color = .gray,
        placeholderFont: Font = .system(size: 15),
        font: Font = .system(size: 15),
        borderWidth: CGFloat = .zero,
        borderColor: Color = .gray,
        focusedBorderColor: Color = .gray,
        cornerRadius: CGFloat = .zero,
        placeholderBottomPadding: CGFloat = .zero,
        disabled: Bool = false,
        leftView: AnyView? = nil,
        rightView: AnyView? = nil
    ) {
        self.isSecureTextEntry = isSecureTextEntry
        self.titleColor = titleColor
        self.placeholderColor = placeholderColor
        self.placeholderFont = placeholderFont
        self.font = font
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.focusedBorderColor = focusedBorderColor
        self.cornerRadius = cornerRadius
        self.placeholderBottomPadding = placeholderBottomPadding
        self.disabled = disabled
        self.leftView = leftView
        self.rightView = rightView
    }
}
