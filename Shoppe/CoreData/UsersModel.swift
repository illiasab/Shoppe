//
//  UsersModel.swift
//  Shoppe
//
//  Created by Андрей Завадский on 07.03.2025.
//

import Foundation
import CoreData

class UsersModel {
    static let shared = UsersModel()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "UsersDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Ошибка загрузки хранилища CoreData: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Ошибка сохранения CoreData: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension UsersModel {
    // Добавление нового пользователя
    func addUser(id: Int, username: String, password: String) {
        let user = UserEntity(context: context)
        user.id = Int16(id)
        user.username = username
        user.password = password

        saveContext()
    }

    // Получение всех пользователей
    func fetchUsers() -> [UserEntity] {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Ошибка загрузки пользователей: \(error)")
            return []
        }
    }

    // Удаление пользователя
    func deleteUser(_ user: UserEntity) {
        context.delete(user)
        saveContext()
    }

    // Поиск пользователя по имени
    func findUser(byUsername username: String) -> UserEntity? {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", username)

        do {
            return try context.fetch(request).first
        } catch {
            print("Ошибка поиска пользователя: \(error)")
            return nil
        }
    }
}
