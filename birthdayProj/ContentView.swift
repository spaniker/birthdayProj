//
//  ContentView.swift
//  birthdayProj
//
//  Created by Syona Paniker on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newBirthday: Date = .now
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name){ friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("New birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = .now
                        
                    }
                    .bold()
                    
                }
                .padding()
                .background(.bar)
            }
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory:true)
}
