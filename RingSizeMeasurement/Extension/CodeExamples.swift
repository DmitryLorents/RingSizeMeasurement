//
//  CodeExamples.swift
//  RingSizeMeasurement
//
//  Created by lorenc_D_K on 19.08.2024.
//

import SwiftUI

struct RotationEffectWithFrameModifier: ViewModifier {
    let angle: Angle
    @State private var size: CGSize = .zero
    var bounds: CGRect {
        CGRect(origin: .zero, size: size)
            .offsetBy(dx: -size.width / 2, dy: -size.height / 2)
            .applying(.init(rotationAngle: CGFloat(angle.radians)))
    }

    func body(content: Content) -> some View {
        content
            .rotationEffect(angle)
            .background(
                GeometryReader { proxy in
                    Color.clear
//                        .task(id: proxy.frame(in: .local)) {
//                            size = proxy.size
//                        }
                }
            )
            .frame(width: bounds.width, height: bounds.height)
    }
}

// MARK: - Calculate dimension

//let backgroundDimensions = background.dimensions(in: .init(width: bounds.width, height: bounds.height))
//    let offsetX = backgroundDimensions[alignment.horizontal]
//    let offsetY = backgroundDimensions[alignment.vertical]
//    // Get the position of the subview's alignment guide
//    let contentDimensions = content.dimensions(in: .init(width: bounds.width, height: bounds.height))
//    // Calculate the topLeading offset of content
//    let leading = offsetX - contentDimensions[alignment.horizontal] + bounds.minX
//    let top = offsetY - contentDimensions[alignment.vertical] + bounds.minY
//    content.place(at: .init(x: leading, y: top), anchor: .topLeading, proposal: .init(width: bounds.width, height: bounds.height))
//}

// MARK: - Use geometry reader to calculate the size
struct SizeInfoModifier: ViewModifier {
    @Binding var size: CGSize
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
//                        .task(id: proxy.size) {
//                            size = proxy.size
//                        }
                }
            )
    }
}

extension View {
    func sizeInfo(_ size: Binding<CGSize>) -> some View {
        self
            .modifier(SizeInfoModifier(size: size))
    }
}

// MARK: - Layout guide
//    .alignmentGuide(.bottom) {
//                            show ? $0[.bottom] : $0[.top]
//                        }

// one more
//struct AlignmentGuideDemo:View{
//    var body: some View{
//        VStack(alignment:.leading) {
//            rectangle // Rectangle1
//                .alignmentGuide(.leading, computeValue: { viewDimensions in
//                    let defaultLeading = viewDimensions[.leading] // default is 0
//                    let newLeading = defaultLeading + 30
//                    return newLeading
//                })
//
//            rectangle // Rectangle2
//        }
//        .border(.pink)
//    }
//
//    var rectangle:some View {
//        Rectangle()
//            .fill(.blue.gradient)
//            .frame(width: 100, height: 100)
//    }
//}
