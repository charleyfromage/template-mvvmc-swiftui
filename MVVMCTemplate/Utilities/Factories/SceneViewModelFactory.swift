//
//  SceneViewModelFactory.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 21/08/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit

final class SceneViewModelFactory {

}

extension SceneViewModelFactory: SomeFlowSceneFactory {
    func makeSomeSceneViewModel(with input: SomeSceneInput) -> SomeSceneViewModelInterface & SomeSceneViewModelOutput {
        let someSceneViewModel = SomeSceneViewModel(input)

        return someSceneViewModel
    }
}
