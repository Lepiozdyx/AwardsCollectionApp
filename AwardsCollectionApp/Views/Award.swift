//
//  Award.swift
//  AwardsCollectionApp
//
//  Created by Alex on 03.07.2023.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    
    static var awards: [Award] {
        [
            Award(
                awardView: AnyView(GradientRectangles().frame(width: 160, height: 160)),
                title: "Gradient Rectangles"
            ),
            Award(
                awardView: AnyView(PathView().frame(width: 160, height: 160)),
                title: "Path View"
            ),
            Award(
                awardView: AnyView(CurvesView().frame(width: 160, height: 160)),
                title: "Curves View"
            ),
            Award(
                awardView: AnyView(MountainView().frame(width: 160, height: 160)),
                title: "Mountain View"
            )
        ]
    }
}
