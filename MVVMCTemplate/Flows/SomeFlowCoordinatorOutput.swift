//
//  SomeFlowCoordinatorOutput.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

protocol SomeFlowCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}
