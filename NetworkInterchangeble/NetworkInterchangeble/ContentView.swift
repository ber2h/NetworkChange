//
//  ContentView.swift
//  NetworkInterchangeble
//
//  Created by Bertuğ Horoz on 16.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    init(){
        self.userListViewModel = UserListViewModel(service: WebService())
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) {user in
            VStack{
                Text(user.name).font(.title3).foregroundColor(.black)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .fontWeight(.semibold)
                Text(user.username)
                    .foregroundColor(.indigo)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .fontWeight(.medium)
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .fontWeight(.medium)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
