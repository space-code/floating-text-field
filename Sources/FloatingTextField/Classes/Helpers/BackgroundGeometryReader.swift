//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

import SwiftUI

/// <#Description#>
struct BackgroundGeometryReader: View {
    // MARK: Properties

    @Binding var size: CGSize

    // MARK: View

    var body: some View {
        GeometryReader(content: placeholderHeight(_:))
    }

    // MARK: Private

    private func placeholderHeight(_ geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            size = geometry.size
        }
        return Color.clear
    }
}
