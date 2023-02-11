//
//  ContentView.swift
//  shoppingListApp
//
//  Created by Mayur Hingaladiya on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet: Bool = false
    @State var grocery: String = ""
    @State var inputFruit: [String] = []
    @State var inputVeg: [String] = []

    
    
    var body: some View {
        NavigationView{
            List{
                Section(
                    header: Text("Fruits: \(inputFruit.count)")) {
                        ForEach(inputFruit, id: \.self) { fruit in
                            Text(fruit.capitalized)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
            }
                Section(
                    header: Text("Veggies: \(inputVeg.count)")) {
                        ForEach(inputVeg, id: \.self) { fruit in
                            Text(fruit.capitalized)
                        }
                        .onDelete(perform: deleteVeg)
                        .onMove(perform: moveVeg)
            }
            }
            .navigationTitle("Shopping List")
            .navigationBarItems(
                leading:
                    HStack {
                        EditButton()
                        Image(systemName: "flame")
                            .font(.subheadline)
                    },
                trailing: addButton)
        }
        
    }
    
    var addButton: some View {
        Button("Add", action: {
            showSheet.toggle()
            
    })
        .sheet(isPresented: $showSheet) {
            
            VStack{
                
                Text("Add Your Item:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                TextField("Enter the grocery", text: $grocery)
                    .padding()
                    .font(.system(size: 20))
                Button("Add Fruit".uppercased()) {
                    addFruit()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .font(.headline)
                .background(Color.blue.cornerRadius(10))
                .foregroundColor(Color.white)
                
                Button("Add Veg".uppercased()) {
                    addVeg()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .font(.headline)
                .background(Color.blue.cornerRadius(10))
                .foregroundColor(Color.white)
                Spacer()
                
            }
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
            .padding()
        }
        

        
    }
    
    func addFruit() {
        inputFruit.append(grocery)
        grocery = ""
    }
    
    func addVeg() {
        inputVeg.append(grocery)
        grocery = ""
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        inputFruit.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func delete(indexSet: IndexSet){
        inputFruit.remove(atOffsets: indexSet)
    }
    
    func moveVeg(indices: IndexSet, newOffset: Int) {
        inputVeg.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func deleteVeg(indexSet: IndexSet){
        inputVeg.remove(atOffsets: indexSet)
    }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
