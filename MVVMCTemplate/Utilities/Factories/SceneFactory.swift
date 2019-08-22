//
//  SceneFactory.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

protocol SomeFlowSceneFactory {
    func makeSomeScene(with viewModel: SomeSceneViewModelInterface) -> Scene
}
