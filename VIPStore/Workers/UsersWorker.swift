//
//  UsersWorker.swift
//  VIPStore
//
//  Created by Guntur Budi on 06/08/21.
//

import Foundation

class UsersWorkers {
    var usersStore : UsersStoreProtocol
    
    init(usersStore: UsersStoreProtocol)
    {
      self.usersStore = usersStore
    }
    
    func fetchUser(id : String,completionHandler: @escaping (Users) -> Void)
    {
       
    }
}

protocol UsersStoreProtocol {
    
    // MARK: Error Handler
    func fetchUser(id: String, completionHandler: @escaping (Users?, UsersError?) -> Void)
    func createUser(userToCreate: Users, completionHandler: @escaping (Users?, UsersError?) -> Void)
    func updateUser(userToUpdate: Users, completionHandler: @escaping (Users?, UsersError?) -> Void)
    func deleteUser(id: String, completionHandler: @escaping (Users?, UsersError?) -> Void)
    
    // MARK: Enum Success Handler
    func fetchUser(id: String, completionHandler: @escaping UsersFetchUserCompletionHandler)
    func createUser(userToCreate: Users, completionHandler: @escaping UsersCreateUserCompletionHandler)
    func updateUser(userToUpdate: Users, completionHandler: @escaping UsersUpdateUserCompletionHandler)
    func deleteUser(id: String, completionHandler: @escaping UsersDeleteUserCompletionHandler)
}


protocol UsersStoreUtilityProtocol {}

extension UsersStoreUtilityProtocol
{
  func generateUsersID(user: inout Users)
  {
    guard user.id == nil else { return }
    user.id = "\(arc4random())"
  }
  
}

typealias UsersFetchUserCompletionHandler = (UsersWorkerResult<Users>) -> Void

typealias UsersUpdateUserCompletionHandler = (UsersWorkerResult<Users>) -> Void

typealias UsersCreateUserCompletionHandler = (UsersWorkerResult<Users>) -> Void

typealias UsersDeleteUserCompletionHandler = (UsersWorkerResult<Users>) -> Void

enum UsersWorkerResult<U>
{
    case Success(result : U)
    case Failure(error : UsersError)
}

enum UsersError : Equatable, Error
{
    case WrongPassword(String)
    case WrongUsername(String)
    case WrongEmail(String)
}
