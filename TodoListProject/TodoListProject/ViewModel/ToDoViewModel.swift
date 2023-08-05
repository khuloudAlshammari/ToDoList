//
//  ToDoViewModel.swift
//  TodoListProject
//
//  Created by khuloud alshammari on 17/01/1445 AH.
//

import Foundation
import SwiftUI

class ToDosViewModel: ObservableObject {
    @State private var serchs : Array<ToDo> = []
    @Published var toDos: [ToDo] = []
    
    
    init() {
        loadData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        
        guard toDo.id != nil else {return}
        
        var newToDo = toDo
        newToDo.isCompleted.toggle()
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        saveData()
    }
    func togglLike(toDo: ToDo) {
        
        guard toDo.id != nil else {return}
        
        var newToDoLike = toDo
        newToDoLike.like.toggle()
        if let index = toDos.firstIndex(where: {$0.id == newToDoLike.id}) {
            toDos[index] = newToDoLike
        }
        saveData()
    }
    
    
    
    
    
    
    func saveToDo(toDo: ToDo) {
        
        if toDo.id == nil {

            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)
      
        
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
      private func showNewitemForSearh(_ value : String){
                if serchs.isEmpty{
                    serchs = toDos
                } else{
                    serchs = toDos.filter { i in  i.item.contains(value) }
                }
            }
    
  
        
    }
     

        

