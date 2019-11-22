//
//  ContentView.swift
//  UITestDemo
//
//  Created by Kristijan Kralj on 03/11/2019.
//  Copyright © 2019 Kristijan Kralj. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
  
  @State var todoItems = ["Make cool app", "Publish it on the App Store", "Profit!"]
  @State var shouldPresentModal = false
  
  func delete(at offsets: IndexSet) {
    todoItems.remove(atOffsets: offsets)
  }
  
  var body: some View {
    
    NavigationView {
      List {
        ForEach(todoItems, id: \.self) { item in
          Text(item)
        }
        .onDelete(perform: delete)
      }
      .navigationBarTitle("Things to do")
      .navigationBarItems(trailing: Button(action: {
        self.shouldPresentModal.toggle()
      }, label: {
        Text("New Item")
          .foregroundColor(.white)
          .padding(8)
          .background(Color.blue)
          .cornerRadius(3)
      }))
        .sheet(isPresented: $shouldPresentModal, content: {
          AddNewItemModal(isPresented: self.$shouldPresentModal, itemAdded: { newItem in
            self.todoItems.append(newItem)
          })
        })
    }
  }
}

struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView()
  }
}

struct AddNewItemModal: View {
  
  @Binding var isPresented: Bool
  @State var newItem = ""
  var itemAdded: (String) -> Void
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 10) {
        TextField("Enter name", text: $newItem)
          .padding(.leading, 10)
          .padding(.vertical, 10)
          .overlay(
            RoundedRectangle(cornerRadius: 4)
              .strokeBorder(style: StrokeStyle(lineWidth: 1)))
        Button(action: {
          self.itemAdded(self.newItem)
          self.isPresented = false
        }, label: {
          HStack {
            Spacer()
            Text("Add")
              .foregroundColor(.white)
              .padding(.vertical, 10)
            
            Spacer()
          }
          .background(Color.green)
          .cornerRadius(4)
        })
        Button(action: {
          self.isPresented = false
        }, label: {
          HStack {
            Spacer()
            Text("Cancel")
              .foregroundColor(.white)
              .padding(.vertical, 10)
            Spacer()
          }
        })
          .background(Color.red)
          .cornerRadius(4)
        Spacer()
      }.navigationBarTitle("Add new item")
        .padding(.all, 20)
    }
  }
}
