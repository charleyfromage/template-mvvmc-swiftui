//
//  SceneFactoryImp.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneFactoryImp {
    let viewModelsFactory = SceneViewModelFactory()
}

extension SceneFactoryImp: SomeFlowSceneFactory {
    func makeSomeScene(someParameters: Any) -> (Scene, SomeSceneViewModelOutput) {
        let someSceneInput = SomeSceneInput()
        let someSceneViewModel = viewModelsFactory.makeSomeSceneViewModel(with: someSceneInput)
        let someScene = UIScene()

        someScene.viewModel = someSceneViewModel

        return (someScene, someSceneViewModel)
    }
}
