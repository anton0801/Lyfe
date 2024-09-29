import SwiftUI

struct SplashView: View {
    
    var timerSplash = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State var time = 0
    
    @State var goToHome = false
    @State var goToAuth = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("LIFE")
                    .font(.custom("Roboto-Regular", size: 60))
                    .foregroundColor(.primaryTextColor)
                
                NavigationLink(destination: AuthHomeView()
                    .navigationBarBackButtonHidden(true), isActive: $goToAuth) {
                        
                    }
                
                NavigationLink(destination: HomeView()
                    .navigationBarBackButtonHidden(true), isActive: $goToAuth) {
                        
                    }
            }
            .background(
                Rectangle()
                    .fill(Color.mainBackground)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .onReceive(timerSplash, perform: { _ in
                if time < 3 {
                    time += 1
                } else {
                    goToAuth = true
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    SplashView()
}
