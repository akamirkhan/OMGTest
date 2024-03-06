import SwiftUI

struct ContentView: View {
    @State private var verticalListCount = Int.random(in: 101...200)
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(0..<verticalListCount, id: \.self) { index in
                    HorizontalListView(viewModel: .init())
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    ContentView()
}
