//
//  AppDelegate.swift
//  spriteMaker
//
//  Created by 박찬울 on 2021/02/19.
//

import UIKit
import CoreData
import AuthenticationServices
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        if let userId = UserDefaults.standard.value(forKey: "userId") as? String {
            appleIDProvider.getCredentialState(forUserID: userId) { (credentialState, error) in
                switch credentialState {
                case .authorized:
                    print("authorized")
                    // The Apple ID credential is valid.
                case .revoked:
                    print("revoked")
                case .notFound:
                    // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                    print("notFound")
                    DispatchQueue.main.async {
                        // self.window?.rootViewController?.showLoginViewController()
                    }
                default:
                    break
                }
            }
        }
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if let userId = UserDefaults.standard.value(forKey: "userId") as? String {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userId) { (credentialState, error) in
                switch credentialState {
                case .revoked:
                    // Apple ID 사용 중단 경우.
                    // 로그아웃
                    print("revoked")
                    print("go to login")
                case .authorized:
                    print("authorized")
                    print("go to home")
                case .notFound:
                    // 잘못된 useridentifier 로 credentialState 를 조회하거나 애플로그인 시스템에 문제가 있을 때
                    print("notFound")
                    print("go to login")
                case .transferred:
                    print("transferred")
                    print("go to login")
                @unknown default:
                    print("default")
                    print("go to login")
                }
            }
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons fo∫ an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

