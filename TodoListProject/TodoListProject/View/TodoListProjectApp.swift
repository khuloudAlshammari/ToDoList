//
//  TodoListProjectApp.swift
//  TodoListProject
//
//  Created by khuloud alshammari on 17/01/1445 AH.
//
//

import SwiftUI

@main
struct ToDoListProjectApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}

