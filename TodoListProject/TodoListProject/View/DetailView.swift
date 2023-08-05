//
//  DetailView.swift
//  TodoListProject
//
//  Created by khuloud alshammari on 17/01/1445 AH.
//
//


import SwiftUI

struct DetailView: View {
    @State private var title: String = ""
    @State private var title2: String = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    
    var body: some View {
        Text(" ● Tasl Title ●")
            .bold()
            .font(.largeTitle)
            .foregroundColor(.black)
        List {
            
            TextField("Enter ToDo here", text: $toDo.item)
                //.font(.largeTitle)
                .bold()
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            //.........
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            //..........
            Text("Descrepiotn :").bold()
                .padding(.top)
            TextField("Enter Descrepiotn", text: $toDo.decreption, axis: .vertical)
               Spacer()
            HStack(){
                Toggle("L", isOn: $toDo.low)
                    .padding()
                    .listRowSeparator(.hidden)
                    .background(.cyan)
                        .cornerRadius(30)
                      
                Toggle("M", isOn: $toDo.medium)
                    .padding()
                    .listRowSeparator(.hidden)
                    .background(.cyan)
                        .cornerRadius(30)
                      

                Toggle("H", isOn: $toDo.high)
                    .padding()
                    .listRowSeparator(.hidden)
                    .background(.cyan)
                        .cornerRadius(30)
                        
            }
               
                //............
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
                HStack(spacing: 90){
                    Toggle("Done", isOn: $toDo.isCompleted)
                        .padding(.top)
                        .listRowSeparator(.hidden)
                    
                    Toggle("Backlog", isOn: $toDo.backlog)
                        .padding(.top)
                        .listRowSeparator(.hidden)
                }
                HStack(spacing: 90){
                    
                    
                    Toggle("ToDo", isOn: $toDo.todo)
                        .padding(.top)
                        .listRowSeparator(.hidden)
                    Toggle("InProgres", isOn: $toDo.inProgress)
                        .padding(.top)
                        .listRowSeparator(.hidden)
                }
                
            }//list
            
            
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                    
                        toDosVM.saveToDo(toDo: toDo)
                        dismiss()
                    }
                    
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.automatic)
        }//body
    }

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(toDo: ToDo())
                .environmentObject(ToDosViewModel())
        }
    }
}
