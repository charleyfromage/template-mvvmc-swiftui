//
//  SomeFlowCoordinator.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

final class SomeFlowCoordinator: BaseCoordinator, SomeFlowCoordinatorOutput {
    private let sceneFactory:   SomeFlowSceneFactory
    private let router:         Router
    private let services:       Services

    var finishFlow: (() -> Void)?

    init(router: Router, sceneFactory: SomeFlowSceneFactory, services: Services) {
        self.sceneFactory = sceneFactory
        self.router = router
        self.services = services
    }

    override func start() {
        showSomeScene()
    }

    private func showSomeScene() {
        let someSceneTuple = sceneFactory.makeSomeScene()    // Returns (SomeSceneInterface, SomeSceneViewModelOutput)
        let someScene = someSceneTuple.0
        let someSceneViewModel = someSceneTuple.1

        // Outputs:
        someSceneViewModel.someOutputMethod = { [weak self] _, _ in
            // ... showSomeOtherScene()
        }

        router.present(filtersOutput, animated: true)
    }
}
