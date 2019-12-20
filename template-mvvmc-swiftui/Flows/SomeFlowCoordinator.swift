//
//  SomeFlowCoordinator.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

final class SomeFlowCoordinator: BaseCoordinator, SomeFlowCoordinatorOutput {
    private let scenesFactory:  SomeFlowScenesFactory
    private let router:         Router
    //    private let services:       Services

    var finishFlow: (() -> Void)?

    init(router: Router, scenesFactory: SomeFlowScenesFactory) {
        self.scenesFactory = scenesFactory
        self.router = router
        //        self.services = services
    }

    override func start() {
        showSomeScene()
    }

    private func showSomeScene() {
        let someScene = scenesFactory.makeSomeScene(someParameter: nil)

        // Outputs:
        if let someSceneViewModel = someScene.viewModel as? SomeSceneViewModelOutput {
            someSceneViewModel.someOutputMethod = {
                // ... showSomeOtherScene()
            }
        }

        router.present(someScene.view, animated: true)
    }
}
