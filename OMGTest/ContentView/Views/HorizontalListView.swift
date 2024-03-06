import SwiftUI

struct HorizontalListView: View {
    @StateObject var viewModel: HorizontalListViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(viewModel.numbers.indices, id: \.self) { index in
                    AnimatedSquare(number: $viewModel.numbers[index])
                }
            }
            .padding(.horizontal)
        }
        .highPriorityGesture(DragGesture())
        .onAppear {
            viewModel.startUpdatingRandomNumber()
        }
    }
}

#Preview {
    HorizontalListView(viewModel: .init())
}
