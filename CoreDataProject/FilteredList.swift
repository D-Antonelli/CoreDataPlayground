//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Derya Antonelli on 07/11/2022.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, predicate: Predicate, filterValue: String, content: @escaping (T) -> Content) {
        var predicateStr = ""
        switch predicate {
        case .beginsWith:
            predicateStr = "BEGINSWITH"
            
        case .contains:
            predicateStr = "CONTAINS"
        }
        // wrap value in a new fetch request
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicateStr) %@", filterKey, filterValue))
        self.content = content
    }
    
    func convert(predicate: Predicate) -> String {
        switch predicate {
        case .beginsWith:
            return "BEGINSWITH"
            
        case .contains:
            return "CONTAINS"
        }
        
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
