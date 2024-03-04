import SwiftUI

struct HorizontalListView: View {
    @State private var numbers = (0..<Int.random(in: 11...20)).map { _ in
        Int.random(in: 1...100)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(numbers.indices, id: \.self) { index in
                    AnimatedSquare(number: $numbers[index])
                }
            }
            .padding(.horizontal)
        }
        .highPriorityGesture(DragGesture())
        .onAppear {
            startUpdatingRandomNumber()
        }
    }
    
    func startUpdatingRandomNumber() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let randomIndex = Int.random(in: 0..<numbers.count)
            numbers[randomIndex] = Int.random(in: 1...100)
        }
    }
}

#Preview {
    HorizontalListView()
}
