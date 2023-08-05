//
//  ToDoListView.swift
//  TodoListProject
//
//  Created by khuloud alshammari on 17/01/1445 AH.
//

import SwiftUI

struct ToDoListView: View {
    
    @State private var serchs : Array<ToDo> = []
    @State var serchindText : String = ""
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    var body: some View {
        
        NavigationStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $serchindText)
                    //.onChange(of:serchs) {newValue in //ToDosViewModel.showNewitemForSearh(newValue)}
                    .frame(height :40)
            }
            .padding(.horizontal,16)
            .padding(.vertical,4)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.black)
            List {
                //heart.fill
                ForEach(toDosVM.toDos) { toDo in
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDosVM.toggleCompleted(toDo: toDo)
                            }.foregroundColor(.green)
                        Image(systemName: toDo.like ? "heart.fill" : "heart")
                            .onTapGesture {
                                toDosVM.togglLike(toDo: toDo)
                            }.foregroundColor(.red)

                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                    .font(.title2)
                }
                
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
                
            }
            .navigationTitle("To Do List :")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton(
                    )
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus.app.fill")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo()) // new value
                }
        }
           .onAppear(){
           
               
            
        }
            
        }
    
        
        }
        
       
            
        }//body
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}
