//
//  AppDelegate.swift
//  XMateriais
//
//  Created by Paulo Rosa on 13/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var ref: DatabaseReference?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        setupNavigationBar()
        initDataBase()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = getLoginInformation()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "XMateriais")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
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
    
    // MARK: - Private Functions
    
    private func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.getPrimaryColor()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.getPrimaryColor()]
    }
    
    private func initDataBase() {
        ref = Database.database().reference()
    }
    
    private func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }

    private func getUserType() {
        let userID : String = (Auth.auth().currentUser?.uid)!
        self.ref!.child("users").child(userID).observeSingleEvent(of: .value, with: {(snapshot) in
            let type = (snapshot.value as! NSDictionary)["type"] as! Int
            Defaults.saveTypeUser(type: type)
        })
    }
    
    private func getLoginInformation() -> UINavigationController? {
        if isUserLoggedIn() {
            getUserType()
            if Defaults.getTypeUser() == 0 {
                let storyboard = UIStoryboard(name: "LoggedCollaborator", bundle: nil)
                let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
                let rootViewController = storyboard.instantiateViewController(withIdentifier: "LoggedCollaboratorViewController")
                navigationController?.viewControllers = [rootViewController]
                navigationController?.modalPresentationStyle = .fullScreen
                return navigationController
            } else {
                let storyboard = UIStoryboard(name: "LoggedResearcher", bundle: nil)
                let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
                let rootViewController = storyboard.instantiateViewController(withIdentifier: "LoggedResearcherViewController")
                navigationController?.viewControllers = [rootViewController]
                navigationController?.modalPresentationStyle = .fullScreen
                return navigationController
            }
        } else {
            Defaults.clearUserData()
            let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
            let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
            let rootViewController = storyboard.instantiateViewController(withIdentifier: "FirstTutorialViewController")
            navigationController?.viewControllers = [rootViewController]
            navigationController?.modalPresentationStyle = .fullScreen
            return navigationController
        }
    }
}
