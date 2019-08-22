//
//  CoordinatorFactoryImp.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

final class CoordinatorFactoryImp: CoordinatorFactory {
    private func navigationController(_ navigationController: UINavigationController?) -> UINavigationController {
        if let navigationController = navigationController {
            return navigationController
        } else {
            return UINavigationController.controllerFromStoryboard(.main)
        }
    }
}

// MARK: - SomeFlow
//extension CoordinatorFactoryImp {
//    func makeSomeCoordinator(router: Router, service: Service) -> SomeCoordinator {
//        let someCoordinator = SomeCoordinator(router: router, factory: ModuleFactoryImp(), service: service)
//
//        return someCoordinator
//    }
//}
