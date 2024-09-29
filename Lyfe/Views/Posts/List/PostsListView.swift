import SwiftUI

struct PostsListView: View {
    
    @State var searchValueText = ""
    
    @State var goToAddPost = false
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Image("profile_image")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .cornerRadius(30)
                    Spacer()
                    
                    Text("LIFE")
                        .font(.custom("Roboto-Regular", size: 16))
                        .foregroundColor(.primaryTextColor)
                        .offset(x: -15)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TextField("", text: $searchValueText)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.inputBackground)
                    )
                    .padding()
                    .font(.custom("Roboto-Regular", size: 18))
                    .foregroundColor(.white)
                    .placeholder(when: searchValueText.isEmpty) {
                        HStack {
                            Image("search_icon")
                                .offset(x: 22)
                            Text("Search")
                                .font(.custom("Roboto-Regular", size: 18))
                                .foregroundColor(.thirdTextColor)
                                .offset(x: 22)
                        }
                        .zIndex(10)
                    }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ZStack {
                            Image("profile_image")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .scaledToFit()
                                .cornerRadius(60)
                            Button {
                                
                            } label: {
                                Image("story_plus")
                            }
                            .offset(x: 25, y: 20)
                        }
                        Image("profile_image")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .cornerRadius(60)
                            .padding(.leading, 6)
                        Image("profile_image")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.leading, 6)
                        Image("profile_image")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.leading, 6)
                        Image("profile_image")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.leading, 6)
                        Image("profile_image")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .cornerRadius(60)
                            .padding(.leading, 6)
                        Image("profile_image")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.leading, 6)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    TabButton(selectedTab: $selectedTab, index: 0, title: "For you")
                    Spacer().frame(width: 70)
                    TabButton(selectedTab: $selectedTab, index: 1, title: "Following")
                    Spacer()
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.init(red: 113/255, green: 112/255, blue: 112/255))
                        .frame(maxWidth: .infinity, maxHeight: 1)
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .frame(width: 70, height: 2)
                        .background(Color.white)
                        .offset(x: selectedTab == 0 ? -75 : 75)
                        .offset(y: -1)
                }
                .offset(y: -5)
                
                TabView(selection: $selectedTab) {
                    Text("Content for Tab 1")
                        .tag(0)
                    
                    Text("Content for Tab 2")
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer()
                
                NavigationLink(destination: AddPostView()
                    .navigationBarBackButtonHidden(true), isActive: $goToAddPost) {
                    
                }
            }
            .background(
                Rectangle()
                    .fill(Color.mainBackground)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .overlay(
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            FloatingActionButton(icon: "plus") {
                                goToAddPost = true
                            }
                            .padding()
                            .offset(x: -16, y: -16)
                        }
                    }
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TabButton: View {
    @Binding var selectedTab: Int
    let index: Int
    let title: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = index
            }
        }) {
            Text(title)
                .font(.custom("Roboto-Bold", size: 12))
                .foregroundColor(.white)
                .padding()
                .cornerRadius(10)
        }
    }
}

struct TabImageButton: View {
    @Binding var selectedTab: Int
    let index: Int
    let image: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = index
            }
        }) {
            Image(image)
                .resizable()
                .frame(width: 18, height: 18)
        }
    }
}

#Preview {
    PostsListView()
}
