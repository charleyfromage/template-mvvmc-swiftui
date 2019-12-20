//
//  ContentView.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import SwiftUI
import Combine

final public class SomeSceneView: View {
//    @ObservableObjectPublisher
    var model: SomeSceneViewModelInterface?

    public var body: some View {
        Text(verbatim: model?.model?.someTitle ?? "")
    }
}

#if DEBUG
struct SomeSceneView_Previews : PreviewProvider {
    static var previews: some View {
        SomeSceneView()
    }
}
#endif
