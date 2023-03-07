//
//  UserList.swift
//  MVVMBindings
//
//  Created by Андрей on 02.03.2023.
//

import Foundation

struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
}
