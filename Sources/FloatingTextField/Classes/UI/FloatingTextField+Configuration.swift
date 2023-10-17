//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

import SwiftUI

// MARK: - Extensions

public extension FloatingTextField {
    func placeholderColor(_ color: Color) -> FloatingTextField {
        configuration.placeholderColor = color
        return self
    }

    func placeholderFont(_ font: Font) -> FloatingTextField {
        configuration.placeholderFont = font
        return self
    }

    func font(_ font: Font) -> FloatingTextField {
        configuration.font = font
        return self
    }

    func borderColor(_ color: Color) -> FloatingTextField {
        configuration.borderColor = color
        return self
    }

    func borderWidth(_ lineWidth: CGFloat) -> FloatingTextField {
        configuration.borderWidth = lineWidth
        return self
    }

    func cornerRadius(_ cornerRadius: CGFloat) -> FloatingTextField {
        configuration.cornerRadius = cornerRadius
        return self
    }

    func placeholderBottomPadding(_ padding: CGFloat) -> FloatingTextField {
        configuration.placeholderBottomPadding = padding
        return self
    }

    func disabled(_ disabled: Bool) -> FloatingTextField {
        configuration.disabled = disabled
        return self
    }

    func textColor(_ color: Color) -> FloatingTextField {
        configuration.titleColor = color
        return self
    }

    func secureField(_ isSecureEntry: Bool) -> FloatingTextField {
        configuration.isSecureEntry = isSecureEntry
        return self
    }

    func focusedBorderColor(_ borderColor: Color) -> FloatingTextField {
        configuration.focusedBorderColor = borderColor
        return self
    }

    func leftView<V: View>(@ViewBuilder _ view: @escaping () -> V) -> FloatingTextField {
        configuration.leftView = AnyView(view())
        return self
    }

    func rightView<V: View>(@ViewBuilder _ view: @escaping () -> V) -> FloatingTextField {
        configuration.rightView = AnyView(view())
        return self
    }
}
