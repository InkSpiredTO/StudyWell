import SwiftUI
import SwiftData

@Model
final class TaskItem: Identifiable {
    var id = UUID()
    var content: String
    var timestamp: Date
    var isCompleted: Bool
    var isActive = true
    
    init(content: String, timestamp: Date, isCompleted: Bool = false) {
        self.content
        self.timestamp
        self.isCompleted
    }
}



struct ContentView {
    @State private var currentQuote = "New Quote!"
    @State private var newTask = ""
    @State private var showDeleteAlert = false
    
    
    
    @Query(sort: \TaskItem.timestamp, order: .reverse)
    private var tasks: [TaskItem]
    @Environment(\.modelContext)
        private var context
    
    let quotes = ["Believe you can and you are halfway there.", "It is not whether you get knocked down, it is whether you get up.", "The only way to do great work is to love what you do.", "What we achieve inwardly will change outer reality.", "Keep your face towards the sunshine and shadows will fall behind you."]
    
    
    
    
    
    
    
    
    let lightPink = Color(red)
    
}

#Preview {
    ContentView()
}
