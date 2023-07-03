//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

//struct AwardsView: View {
//    var body: some View {
//        NavigationStack {
//            VStack {
//                ScrollView {
//                    GradientRectangles()
//                        .frame(width: 200, height: 200)
//                    PathView()
//                        .frame(width: 200, height: 200)
//                    CurvesView()
//                        .frame(width: 200, height: 200)
//                    MountainView()
//                        .frame(width: 200, height: 200)
//                }
//            }
//            .navigationBarTitle("Awards")
//        }
//    }
//}

struct AwardsView: View {
    private var awards = Award.awards
    private let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(awards, id: \.title) { award in
                        VStack {
                            award.awardView
                            Text(award.title)
                        }
                    }
                }
            }
            .navigationTitle("Your awards: \(awards.count)")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
