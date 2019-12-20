//
//  CoordinatorFactoryImp.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

final class CoordinatorFactoryImp: CoordinatorFactory {
//    private func navigationController(_ navigationController: UINavigationController?) -> UINavigationController {
//        if let navigationController = navigationController {
//            return navigationController
//        } else {
//            return UINavigationController.controllerFromStoryboard(.main)
//        }
//    }
}

// MARK: - SomeFlow
extension CoordinatorFactoryImp {
    func makeSomeFlowCoordinator(router: Router) -> SomeFlowCoordinator {
        let someFlowCoordinator = SomeFlowCoordinator(router: router, scenesFactory: ScenesFactoryImp())

        return someFlowCoordinator
    }
}
