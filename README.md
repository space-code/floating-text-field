![FloatingTextField: A Customizable Text Field](https://raw.githubusercontent.com/space-code/space-code/dev/Resources/floating-text-field.png)

<h1 align="center" style="margin-top: 0px;">floating-text-field</h1>

<p align="center">
<a href="https://github.com/space-code/floating-text-field/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/floating-text-field?style=flat"></a> 
<a href="https://developer.apple.com/swift"><img alt="5.7" src="https://img.shields.io/badge/language-Swift5.7-orange.svg"/></a>
<a href="https://github.com/space-code/floating-text-field"><img alt="CI" src="https://github.com/space-code/floating-text-field/actions/workflows/ci.yml/badge.svg?branch=main"></a>
<a href="https://github.com/apple/swift-package-manager" alt="floating-text-field on Swift Package Manager" title="floating-text-field on Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>
</p>

## Description
`floating-text-field` is a customizable text field.

- [Usage](#usage)
- [Requirements](#requirements)
- [Installation](#installation)
- [Communication](#communication)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Usage

### Basic Usage

For basic usage, simply import the `FloatingTextField` package and set the text field height as follows:

```swift
import FloatingTextField

struct ContentView: View {
    @State private var username: String = ""

    var body: some View {
        FloatingTextFieldView($username, placeholder: "username")
            .frame(height: 60.0)
    }
}
```

### Custom Fonts and Colors

The `FloatingTextField` provides an opportunity to customize text font, text color, placeholder font, placeholder color, and more.

```swift
import FloatingTextField

struct ContentView: View {
    @State private var username: String = ""

    var body: some View {
        FloatingTextFieldView($username, placeholder: "username")
            .font(Font.system(size: 17.0))
            .placeholderFont(Font.system(size: 14.0))
            .textColor(.black)
            .placeholderColor(.gray)
            .frame(height: 60.0)
    }
}
```

### Custom Styles

You can create a text field style in two simple steps.

1. Define a custom text field style as follows:

```swift
import FloatingTextField

struct CustomTextFieldStyle: FloatingTextFieldStyle {
    func body(content: FloatingTextField) -> FloatingTextField {
        content
            .font(Font.system(size: 17.0))
            .placeholderFont(Font.system(size: 14.0))
            .cornerRadius(12)
            .placeholderBottomPadding(4.0)
            .textColor(.black)
            .placeholderColor(.gray)
            .borderWidth(1)
            .borderColor(.black)
    }
}
```

2. Apply this style using `textFieldStyle(_:)`:

```swift
struct ContentView: View {
    @State private var username: String = ""

    var body: some View {
        FloatingTextFieldView($username, placeholder: "username")
            .textFieldStyle(style: CustomTextFieldStyle())
            .frame(height: 60.0)
    }
}
```

### Secure Text Entry

The `FloatingTextField` can conceal sensitive data such as passwords. You can hide it by using the `isSecureTextEntry(_:)` modifier.

```swift
import FloatingTextField

struct ContentView: View {
    @State private var password: String = ""
    @State private var isPasswordHidden: Bool = true

    var body: some View {
        FloatingTextField($password, placeholder: "Password")
            .textFieldStyle(style: CustomTextFieldStyle())
            .isSecureTextEntry(isPasswordHidden)
            .leftView {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
            }
            .rightView {
                Button(
                    action: { isPasswordHidden.toggle() },
                    label: {
                        Image(systemName: "eye.fill")
                            .foregroundColor(.gray)
                    }
                )
            }
            .frame(height: 60.0)
    }
}
```

## Requirements

- iOS 15.0+
- Xcode 14.0
- Swift 5.7

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but `floating-text-field` does support its use on supported platforms.

Once you have your Swift package set up, adding `floating-text-field` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/space-code/floating-text-field.git", .upToNextMajor(from: "1.0.0"))
]
```

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributing
Bootstrapping development environment

```
make bootstrap
```

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author
Nikita Vasilev, nv3212@gmail.com

## License
floating-text-field is available under the MIT license. See the LICENSE file for more info.