import SwiftUI
import Combine

final class HorizontalListViewModel: ObservableObject {
    @Published var numbers = (0..<Int.random(in: 11...20)).map { _ in
        Int.random(in: 1...100)
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var cancellable: AnyCancellable?
    
    func startUpdatingRandomNumber() {
        cancellable = timer.sink { [weak self] _ in
            guard let self else { return }
            let randomIndex = Int.random(in: 0..<numbers.count)
            numbers[randomIndex] = Int.random(in: 1...100)
        }
    }
}

