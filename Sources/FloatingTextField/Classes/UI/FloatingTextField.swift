//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

import SwiftUI

// MARK: - FloatingTextField

/// A control that displays an editable text interface.
///
/// You create a text field with a label and a binding to a value. The text field updates this value continuously as
/// the user types or otherwise edits the text in the field.
///
/// The following example demonstrates a text field designed for accepting a username with custom configuration.
///
/// ```swift
/// struct ContentView: View {
///
///    @State private var username: String = ""
///
///    var body: some View {
///        FloatingTextField($username, placeholder: "title")
///            .borderWidth(1)
///            .borderCornerRadius(12)
///            .borderColor(Color.black)
///            .textFont(Font.system(size: 17.0))
///            .placeholderFont(Font.system(size: 14.0))
///    }
/// }
/// ```
public struct FloatingTextField: View {
    // MARK: Properties

    /// The top placeholder size.
    @State private var placeholderSize: CGSize = .zero
    /// The text field size.
    @State private var textFieldSize: CGSize = .zero

    /// When focus moves to the view, the binding sets the bound value to true.
    @State private var isSelected = false
    /// The text to display and edit.
    @Binding private var text: String
    /// When focus moves to the view, the binding sets the bound value to true.
    @FocusState private var isFocused: Bool
    /// The text field configuratuion.
    @ObservedObject var configuration = FloatingTextFieldConfiguration()

    /// A bool value that indicates whether the placeholder is shown or not.
    private var isTopPlaceholderVisible: Bool {
        !text.isEmpty || isSelected
    }

    /// The title of the text view, describing its purpose.
    private let placeholder: String

    // MARK: Initialization

    /// Creates a text field with a text label generated and a placeholder.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit.
    ///   - placeholder: The title of the text view, describing its purpose.
    public init(_ text: Binding<String>, placeholder: String) {
        _text = text
        self.placeholder = placeholder
    }

    // MARK: View

    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: .zero) {
                ZStack(alignment: .leading) {
                    topPlaceholderView
                        .background(BackgroundGeometryReader(size: $placeholderSize))
                        .opacity(!text.isEmpty || isSelected ? 1 : .zero)
                        .offset(y: !text.isEmpty || isSelected ? -offset(for: placeholderSize) : .zero)

                    HStack(alignment: .center) {
                        leftView
                        contentView
                            .background(BackgroundGeometryReader(size: $textFieldSize))
                            .offset(y: !text.isEmpty || isSelected ? offset(for: textFieldSize) : .zero)
                        rightView
                    }
                }
            }
            .onChange(of: isFocused) { newValue in
                withAnimation(.easeInOut(duration: .animationDuration)) {
                    isSelected = newValue
                }
            }
            .padding()
            .frame(maxHeight: geometry.size.height)
            .overlay(
                RoundedRectangle(cornerRadius: configuration.borderCornerRadius)
                    .strokeBorder(
                        isFocused ? configuration.borderColor : configuration.focusedBorderColor,
                        lineWidth: configuration.borderWidth
                    )
            )
        }
    }

    // MARK: Private

    private var topPlaceholderView: some View {
        Text(placeholder)
            .font(configuration.placeholderFont)
            .foregroundColor(configuration.placeholderColor)
            .frame(alignment: .leading)
    }

    private var placeholderView: some View {
        Text(placeholder)
            .foregroundColor(configuration.placeholderColor)
            .font(configuration.font)
    }

    private var secureField: some View {
        SecureField(String.empty, text: $text.animation())
            .foregroundColor(configuration.titleColor)
            .multilineTextAlignment(.leading)
            .font(configuration.font)
            .focused($isFocused)
            .disabled(configuration.disabled)
    }

    private var textField: some View {
        TextField(String.empty, text: $text.animation())
            .foregroundColor(configuration.titleColor)
            .multilineTextAlignment(.leading)
            .font(configuration.font)
            .focused($isFocused)
            .disabled(configuration.disabled)
    }

    private var contentView: some View {
        ZStack(alignment: .leading) {
            if !isTopPlaceholderVisible {
                placeholderView
            }

            if configuration.isSecureEntry {
                secureField
            } else {
                textField
            }
        }
    }

    private var leftView: some View {
        configuration.leftView.map { $0 }
    }

    private var rightView: some View {
        configuration.rightView.map { $0 }
    }

    // MARK: Helpers

    private func offset(for size: CGSize) -> CGFloat {
        (size.height + configuration.placeholderBottomPadding) / 2.0
    }
}

// MARK: - Constants

private extension String {
    static let empty = ""
}

private extension TimeInterval {
    static let animationDuration = 0.178
}

// MARK: - Previews

#if DEBUG
    // swiftlint:disable:next type_name
    struct FloatingTextField_Preview: PreviewProvider {
        static var previews: some View {
            ForEach(ColorScheme.allCases, id: \.self) {
                FloatingTextField(.constant(""), placeholder: "placeholder")
                    .borderWidth(1)
                    .borderCornerRadius(12)
                    .frame(height: 60.0)
                    .preferredColorScheme($0)

                FloatingTextField(.constant("text"), placeholder: "placeholder")
                    .borderWidth(1)
                    .borderCornerRadius(12)
                    .focusedBorderColor(.red)
                    .frame(height: 60.0)
                    .preferredColorScheme($0)
            }
        }
    }
#endif
