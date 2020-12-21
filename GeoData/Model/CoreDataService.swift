import Foundation
import CoreData

let persistentContainer: NSPersistentContainer = {
  let container = NSPersistentContainer(name: "Model")

  container.loadPersistentStores { description, error in
    if let error = error {
      fatalError("Unable to load persistent stores: \(error)")
    }
  }

  return container
}()
