//
// floating-text-field
// Copyright © 2023 Space Code. All rights reserved.
//

import SwiftUI

// A view that reads the geometry of its parent view and updates a binding variable with its size.
struct BackgroundGeometryReader: View {
    // MARK: Properties

    @Binding var size: CGSize

    // MARK: View

    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .onAppear {
                    size = geometry.size
                }
        }
    }
}
