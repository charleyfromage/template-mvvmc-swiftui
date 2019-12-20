//
//  BaseCoordinator.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

open class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    func start() {
//        start(with: nil)
    }

//    func start(with option: DeepLinkOption? = nil) { }

    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator { return }

        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)

            break
        }
    }
}
