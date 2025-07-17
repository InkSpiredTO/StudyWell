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
        self.content = content
        self.timestamp = timestamp
        self.isCompleted = isCompleted
    }
}

struct ContentView: View {
    
    @State private var currentQuote = "Tap 'New Quote' for inspiration!"
    @State private var newTask = ""
    @State private var showDeleteAlert = false
    
    @Query(sort: \TaskItem.timestamp, order: .reverse)
    private var tasks: [TaskItem]
    @Environment(\.modelContext) private var context
    
    let quotes = [
        "Believe you can and you're halfway there.",
        "It is not whether you get knocked down, it is whether you get up.",
        "The only way to do great work is to love what you do.",
        "What we achieve inwardly will change outer reality.",
        "Keep your face towards the sunshine and shadows will fall behind you."
    ]
    
    let lightPink = Color(red: 1.0, green: 0.95, blue: 0.95)
    let lightGreen = Color(red: 0.7, green: 0.9, blue: 0.7)
    
    var body: some View {
        NavigationStack {
            ZStack {
                lightPink.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    headerSection()
                    
                    quoteSection()
                        .padding(.horizontal, 24)
                    
                    navigationButtons()
                        .padding(.horizontal, 24)
                        .padding(.top, 16)
                    
                    taskListSection()
                    
                    Spacer()
                }
            }
        }
    }
    
    private func headerSection() -> some View {
        VStack(spacing: 4) {
            Text("StudyWell")
                .font(.system(size: 42, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 24)
            
            Divider()
                .padding(.horizontal, 24)
                .padding(.top, 8)
        }
    }
    
    private func quoteSection() -> some View {
        VStack(spacing: 12) {
            Button(action: generateNewQuote) {
                Text("New Quote")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(lightGreen)
                    .cornerRadius(20)
            }
            
            Text(currentQuote)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white)
                .cornerRadius(12)
        }
    }
    
    private func navigationButtons() -> some View {
        HStack(spacing: 16) {
            NavigationLink {
                StudyCornerView()
            } label: {
                Text("Study Corner")
                    .frame(maxWidth: .infinity)
            }
            
            NavigationLink {
                WellnessCornerView()
            } label: {
                Text("Wellness Corner")
                    .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(lightGreen)
        .font(.headline)
    }
    
    private func taskListSection() -> some View {
        VStack(spacing: 8) {
            HStack {
                Text("My Tasks")
                    .font(.title2.bold())
                    .padding(.leading, 32)
                    .padding(.top, 24)
                
                Spacer()
            }
            
            HStack {
                TextField("Add new task...", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.done)
                    .onSubmit { newTask.isEmpty ? nil : addTask() }
                    .padding(.leading, 32)
                
                Button {
                    addTask()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
                .disabled(newTask.isEmpty)
                .padding(.trailing, 32)
            }
            .padding(.top, 8)
            
            List {
                ForEach(tasks.filter { $0.isActive }) { task in
                    TaskRow(task: task) {
                        completeTask(task)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            deleteTask(task)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(lightPink)
            .frame(height: CGFloat(tasks.filter { $0.isActive }.count) * 64 + 32)
        }
    }
    
    private func generateNewQuote() {
        withAnimation(.easeInOut) {
            currentQuote = quotes.randomElement() ?? "No quotes available"
        }
    }
    
    private func addTask() {
        guard !newTask.isEmpty else { return }
        
        let task = TaskItem(content: newTask, timestamp: Date())
        context.insert(task)
        newTask = ""
    }
    
    private func completeTask(_ task: TaskItem) {
        withAnimation(.easeInOut) {
            task.isCompleted = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                deleteTask(task)
            }
        }
    }
    
    private func deleteTask(_ task: TaskItem) {
        withAnimation {
            context.delete(task)
        }
    }
}

struct TaskRow: View {
    @Bindable var task: TaskItem
    var onComplete: () -> Void
    
    var body: some View {
        HStack {
            Button {
                onComplete()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            
            Text(task.content)
                .strikethrough(task.isCompleted)
                .foregroundColor(task.isCompleted ? .gray : .black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(.white)
        .cornerRadius(12)
        .contentShape(Rectangle())
    }
}

struct StudyCornerView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.95, blue: 0.95).ignoresSafeArea()
            Text("Study Corner Content")
                .font(.title.bold())
        }
        .navigationTitle("Study Corner")
    }
}

struct WellnessCornerView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.95, blue: 0.95).ignoresSafeArea()
            Text("Wellness Corner Content")
                .font(.title.bold())
        }
        .navigationTitle("Wellness Corner")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TaskItem.self, inMemory: true)
}

