//
//  SceneViewModelsFactory.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 21/08/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit

public final class SceneViewModelsFactory {

}

extension SceneViewModelsFactory {
    func makeSomeSceneViewModel(with input: SomeSceneInput) -> SomeSceneViewModelInterface & SomeSceneViewModelOutput {
        let someSceneViewModel = SomeSceneViewModel(with: input)

        return someSceneViewModel
    }
}
