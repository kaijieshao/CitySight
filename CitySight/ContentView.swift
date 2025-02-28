import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for?", text: $query)
            Button {
                // TODO: Implement query
            } label: {
                Text("Go")
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .task {
        // Attaches a task modifier to the view, which runs an async task when the view appears.
            await service.businessSearch()
            // Calls the businessSearch() method from the DataService instance asynchronously.
            // The network request to search for businesses as soon as the view appears.
        }
    }
}

#Preview {
    ContentView()
}

