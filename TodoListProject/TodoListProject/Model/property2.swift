//
//  property2.swift
//  TodoListProject
//
//  Created by khuloud alshammari on 17/01/1445 AH.
//

import Foundation


enum Priority2: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case Backlog = "Backlog"
    case Todo = "Todo"
    case InProgress = "InProgress"
    case Done = "Done"
}

extension Priority2 {
    
    var title2 : String {
        switch self {
        case .Backlog:
                return "Backlog"
        case .Todo:
                return "Todo"
        case .InProgress:
                return "InProgress"
        case .Done:
            return "Done"
        }
    }
}


