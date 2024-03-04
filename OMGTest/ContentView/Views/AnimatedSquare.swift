import SwiftUI

struct AnimatedSquare: View {
    @State private var isPressed = false
    @Binding var number: Int
    
    var body: some View {
        Text("\(number)")
            .frame(width: 80, height: 80)
            .background(Color.blue)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: 4)
            )
            .cornerRadius(10)
            .onLongPressGesture(perform: {}) { pressed in
                isPressed = pressed
            }
            .scaleEffect(isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
    }
}

#Preview {
    AnimatedSquare(number: .constant(9))
}
