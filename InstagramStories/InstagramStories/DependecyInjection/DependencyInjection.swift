//
//  DependencyInjection.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

extension InjectedValues {
    var userReaderService: UserReader {
        get { Self[UserReaderServiceInjectionKey.self] }
        set { Self[UserReaderServiceInjectionKey.self] = newValue }
    }
    
    var persistenceService: PersistenceService {
        get { Self[PersistenceServiceInjectionKey.self] }
        set { Self[PersistenceServiceInjectionKey.self] = newValue }
    }
}

private struct UserReaderServiceInjectionKey: InjectionKey {
    static var currentValue: UserReader = {
        return UserReaderService()
    }()
}

private struct PersistenceServiceInjectionKey: InjectionKey {
    static var currentValue: PersistenceService = {
        return PersistenceService()
    }()
}
