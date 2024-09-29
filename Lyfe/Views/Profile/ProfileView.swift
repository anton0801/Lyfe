import SwiftUI

struct ProfileView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Image("profile_image_test")
                        .resizable()
                        .frame(width: .infinity, height: 150)
                        .ignoresSafeArea()
                    HStack {
                        Image("profile_image_big")
                            .offset(y: -115)
                            .frame(width: 100, height: 100)
                        
                        Spacer()
                        Spacer()
                        
                        HStack {
                            Spacer()
                            VStack {
                                Text("128")
                                    .font(.custom("Roboto-Regular", size: 20))
                                    .foregroundColor(.white)
                                Text("POSTS")
                                    .font(.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            VStack {
                                Text("5.5M")
                                    .font(.custom("Roboto-Regular", size: 20))
                                    .foregroundColor(.white)
                                Text("Followers")
                                    .font(.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            VStack {
                                Text("39")
                                    .font(.custom("Roboto-Regular", size: 20))
                                    .foregroundColor(.white)
                                Text("Follows")
                                    .font(.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .offset(y: -85)
                    }
                    .padding(.horizontal)
                    
                    
                    HStack {
                        Text("Casa de S.M. el Rey")
                            .font(.custom("Roboto-Bold", size: 18))
                            .foregroundColor(.white)
                        
                        Image("verif")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .offset(y: -105)
                    
                    Text("@casareal")
                        .font(.custom("Roboto-Regular", size: 15))
                        .foregroundColor(.thirdTextColor)
                        .padding(.horizontal)
                        .offset(y: -100)
                
                    Text("Información sobre la actividad de la Familia Real española y la Casa de S.M. el Rey.")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .offset(y: -90)
                    
                    HStack {
                        Image("link")
                        Text("casareal.es")
                            .font(.custom("Roboto-Regular", size: 14))
                            .foregroundColor(.linkColor)
                            .underline()
                    }
                    .padding(.horizontal)
                    .offset(y: -90)
                    
                    Button {
                        
                    } label: {
                        Text("Change")
                            .foregroundColor(.mainBackground)
                            .font(.custom("Roboto-Bold", size: 14))
                            .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(.white)
                            )
                    }
                    .offset(y: -80)
                    .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        TabImageButton(selectedTab: $selectedTab, index: 0, image: "home_button")
                        Spacer()
                        TabImageButton(selectedTab: $selectedTab, index: 1, image: "gallery")
                        Spacer()
                        TabImageButton(selectedTab: $selectedTab, index: 2, image: "video")
                        Spacer()
                        TabImageButton(selectedTab: $selectedTab, index: 3, image: "retweet")
                        Spacer()
                    }
                    .offset(y: -70)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.init(red: 113/255, green: 112/255, blue: 112/255))
                            .frame(maxWidth: .infinity, maxHeight: 1)
                        
                        if selectedTab == 0 {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.white)
                                .frame(width: 70, height: 2)
                                .background(Color.white)
                                .offset(x: 40, y: -1)
                                .animation(.easeIn)
                        } else if selectedTab == 1 {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.white)
                                .frame(width: 70, height: 2)
                                .background(Color.white)
                                .offset(x: 125, y: -1)
                                .animation(.easeIn)
                        } else if selectedTab == 2 {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.white)
                                .frame(width: 70, height: 2)
                                .background(Color.white)
                                .offset(x: 205, y: -1)
                                .animation(.easeIn)
                        } else if selectedTab == 3 {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.white)
                                .frame(width: 70, height: 2)
                                .background(Color.white)
                                .offset(x: 290, y: -1)
                                .animation(.easeIn)
                        }
                    }
                    .offset(y: -65)
                    
                    TabView(selection: $selectedTab) {
                        Text("Content for Tab 1")
                            .foregroundColor(.white)
                            .tag(0)
                        
                        Text("Content for Tab 2")
                            .foregroundColor(.white)
                            .tag(1)
                        
                        Text("Content for Tab 3")
                            .foregroundColor(.white)
                            .tag(2)
                                 
                        Text("Content for Tab 4")
                            .foregroundColor(.white)
                            .tag(3)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingActionButton(icon: "plus") {
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(
                Rectangle()
                    .fill(Color.mainBackground)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ProfileView()
}
