//
//  UserViewModel.swift
//  NetworkInterchangeble
//
//  Created by Bertuğ Horoz on 17.11.2022.
//

import Foundation

class UserListViewModel: ObservableObject{
    
    @Published var userList = [userViewModel]()
    
    //let webservice = WebService()
    private var service : NetworkService
    init(service : NetworkService){
        self.service = service
    }
    func downloadUsers() async{
        
        var resource = ""
        
        if service.type == "Webservice"{
            resource = Constants.Urls.userExtension
        }else{
            resource = Constants.Paths.baseUrl
        }
        
        
        do{
            let users = try await service.donwload(resource)
            DispatchQueue.main.async {
                self.userList = users.map(userViewModel.init)
            }
        }catch{
            print(error)
        }
        
    }
    
}

struct userViewModel{
    
    let user : User
    
    var id : Int{
        user.id
    }
    
    var name : String{
        user.name
    }
    
    var username : String{
        user.username
    }
    
    var email : String{
        user.email
    }
    
    
}
