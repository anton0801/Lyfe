import SwiftUI

struct FloatingActionButton: View {
    
    var icon: String
    var tapAction: () -> Void
    
    var body: some View {
        Button(action: {
            tapAction()
        }) {
            Image(icon)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .padding()
        }
        .background(Color.white)
        .clipShape(Circle())
    }
}

#Preview {
    FloatingActionButton(icon: "plus") {
        
    }
}
