//
//  ContentView.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import SwiftUI

struct SomeSceneView : View {
    @ObjectBinding var viewModel: SomeSceneViewModelInterface?

    var body: some View {
        Text(viewModel?.model?.someTitle)
    }
}

#if DEBUG
struct SomeSceneView_Previews : PreviewProvider {
    static var previews: some View {
        SomeSceneView()
    }
}
#endif
