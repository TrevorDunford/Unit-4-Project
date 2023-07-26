//
//  CoreDataManager.swift
//  DMFindingGame
//
//  Created by Trevor Dunford on 7/10/23.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    /**
     Add the passed score to CoreData.
     */
    func addScore(score: Int) {
        let managedContext = AppDelegate.persistentContainer.viewContext
        
        let scoreEntity = NSEntityDescription.entity(forEntityName: "Score", in: managedContext)!
        let score = NSManagedObject(entity: scoreEntity, insertInto: managedContext)
        
        score.setValue(scoreValue, forKeyPath: "value")
        score.setValue(Date(), forKeyPath: "date")
        
        do {
            try managedContext.save()
            print("Score saved successfully.")
        } catch let error as NSError {
            print("Could not save score. Error: \(error), \(error.userInfo)")
        }
    }
    
    /**
     Retrieve all the scores from CoreData.
     */
    func fetchScores() -> [score]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        /**
         Calculate the high score.
         */
        func calculateHighScore() -> Int {
            return 0
            var highestScore = score[0]
               
               for score in score {
                   if score > highestScore {
                       highestScore = score
                   }
               }
               
               return highestScore
        }
    }
}
