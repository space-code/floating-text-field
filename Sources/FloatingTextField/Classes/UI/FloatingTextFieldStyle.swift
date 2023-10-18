//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

import SwiftUI

// MARK: - FloatingTextFieldStyle

/// A protocol for defining styles for a floating text field.
public protocol FloatingTextFieldStyle {
    /// Applies the style to the provided content.
    ///
    /// - Parameter content:  The floating text field to style.
    ///
    /// - Returns: The modified floating text field with the defined style.
    func body(content: FloatingTextField) -> FloatingTextField
}

public extension FloatingTextField {
    func textFieldStyle(style: FloatingTextFieldStyle) -> FloatingTextField {
        style.body(content: self)
    }
}
