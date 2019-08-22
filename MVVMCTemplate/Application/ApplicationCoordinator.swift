//
//  ApplicationCoordinator.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

private enum LaunchInstructor {
    /* Used to implement launch cases
     *
     * Ex:
     *
     * fileprivate var onboardingWasShown = false
     * fileprivate var isAutorized = false
     *
     * fileprivate enum LaunchInstructor {
     *    case main, auth, onboarding
     *
     *    static func configure(tutorialWasShown: Bool = onboardingWasShown, isAutorized: Bool = isAutorized) -> LaunchInstructor {
     *        switch (tutorialWasShown, isAutorized) {
     *            case (true, false), (false, false): return .auth
     *            case (false, true): return .onboarding
     *            case (true, true): return .main
     *        }
     *   }
     * }
     */

    case main

    static func configure() -> LaunchInstructor {
        return .main
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router:             Router
    private let storage =           Storage()
//    private let service =           Service()

    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start(with option: DeepLinkOption? = nil) {
        /* Switch on deeplink options:
         * if let option = option {
         *  // Start with deepLink.
         *     switch option {
         *     case .onboarding: runOnboardingFlow()
         *     case .signUp: runAuthFlow()
         *     default: childCoordinators.forEach { coordinator in
         *         coordinator.start(with: option)
         *         }
         *     }
         * } else {
         */

        // Default start.
        switch instructor {
            case .main:  runAuthenticationFlow()
        }
    }

    private func runSomeFlow() {
        let someCoordinator = coordinatorFactory.makeAuthenticationCoordinatorBox(router: router, service: service)

        someCoordinator.finishFlow = { [weak self, weak someCoordinator] in
//            runSomeOtherFlow()

            self?.removeDependency(someCoordinator)
        }

        addDependency(coordinator)
        coordinator.start()
    }
}
