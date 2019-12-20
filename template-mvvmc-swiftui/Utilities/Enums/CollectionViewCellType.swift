//
//  CollectionViewCellType.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

public enum CollectionViewCellType {
//    case someCell(SomeCellViewModelInterface)

    var identifier: String {
        switch self {
//            case .someCell: return SomeCell.identifier
        }
    }

    var type: AnyClass {
        switch self {
//            case .outerSeparatorCell: return SomeCell.self
        }
    }
}
