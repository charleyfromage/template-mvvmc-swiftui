//
//  ScenesFactoryImp.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit
import SwiftUI

final class ScenesFactoryImp {
    let viewModelsFactory = SceneViewModelsFactory()
}

extension ScenesFactoryImp: SomeFlowScenesFactory {
    func makeSomeScene(someParameter: Any? = nil) -> Scene<SomeSceneView> {
        let someSceneInput = SomeSceneInput(someParameter: someParameter)
        let someSceneViewModel = viewModelsFactory.makeSomeSceneViewModel(with: someSceneInput)
        let someSceneView = SomeSceneView()

        someSceneView.model = someSceneViewModel

        let scene = Scene(view: someSceneView, viewModel: someSceneViewModel)

        return scene
    }
}
