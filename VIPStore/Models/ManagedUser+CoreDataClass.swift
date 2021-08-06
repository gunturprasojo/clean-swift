//
//  ManagedUser+CoreDataClass.swift
//  VIPStore
//
//  Created by Guntur Budi on 03/08/21.
//

import Foundation
import CoreData

public class ManagedUsers : NSManagedObject {
    
    func toUser() -> Users {
        let id : String = id!
        let username : String = username!
        let password : String = password!
        let firstname : String = firstname!
        let lastname : String = lastname!
        let email : String = email!
        return Users(id: id,
                     username: username,
                     password: password,
                     firstname: firstname,
                     lastname: lastname,
                     email: email)
    }
    
    func fromUser(user : Users){
        id = user.id
        username = user.username
        password = user.password
        firstname = user.firstname
        lastname = user.lastname
        email = user.email
    }
}
