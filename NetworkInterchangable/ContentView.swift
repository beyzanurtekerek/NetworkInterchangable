//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Beyza Nur Tekerek on 5.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Localservice())
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
