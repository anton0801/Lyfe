import SwiftUI

struct HomeView: View {
    
    @State var selectedPage = 0
    
    @State var drawerOpened = false
    @State var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedPage) {
                PostsListView()
                    .tabItem {
                        Image("home_button")
                    }
                
                PostsListView()
                    .tabItem {
                        Image("shorts")
                    }
                
                PostsListView()
                    .tabItem {
                        Image("messenger")
                    }
                
                ProfileView()
                    .tabItem {
                        Image("profile")
                    }
            }
            .preferredColorScheme(.dark)
            .background(
                Rectangle()
                    .fill(Color.mainBackground)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            
            if drawerOpened {
                NavigationView {
                    NavigationDrawer(selectedPage: $selectedPage, isOpen: drawerOpened)
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    // Detect swipe from left to right and trigger drawer open
                    if gesture.translation.width > 50 && !drawerOpened {
                        withAnimation {
                            self.drawerOpened = true
                        }
                    }
                }
        )
    }
}

#Preview {
    HomeView()
}
