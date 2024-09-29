import SwiftUI

struct NavigationDrawer: View {
    
    @Binding var selectedPage: Int
    private let width = UIScreen.main.bounds.width - 100
    let isOpen: Bool
    
    var body: some View {
        HStack {
            DrawerContent(selectedPage: $selectedPage)
                .frame(width: self.width)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.default)
            Spacer()
        }
    }
}

struct DrawerContent: View {
    
    @Binding var selectedPage: Int
    
    @State var moreContentExpanded = false
    
    var body: some View {
        VStack {
            Button {
                selectedPage = 3
            } label: {
                HStack {
                    Image("profile_image_big")
                        .frame(width: 100, height: 100)
                    VStack {
                        Text("Casa de S.M. el Rey")
                            .font(.custom("Roboto-Bold", size: 16))
                            .foregroundColor(.white)
                        
                        Text("@casareal")
                            .font(.custom("Roboto-Regular", size: 11))
                            .foregroundColor(.thirdTextColor)
                            .padding(.horizontal)
                    }
                }
            }
            
            HStack {
                Image("ic_premium")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Premium")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Regular", size: 20))
            }
            
            HStack {
                Image("ic_notification")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Notifications")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Regular", size: 20))
            }
            
            HStack {
                Image("ic_saved")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Save")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Regular", size: 20))
            }
            
            HStack {
                Image("ic_monetezation")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Monetization")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Regular", size: 20))
            }
            
            HStack {
                Image("ic_saved")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Regular", size: 20))
            }
            
            Rectangle()
                .fill(Color.init(red: 225/255, green: 225/255, blue: 225/255))
                .frame(width: 150)
            
            HStack {
                Text("More")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Regular", size: 18))
                Spacer()
                Button {
                    moreContentExpanded.toggle()
                } label: {
                    if moreContentExpanded {
                        Image(systemName: "chevron.up")
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            
            if moreContentExpanded {
                HStack {
                    Image("ic_ads")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Ads")
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Regular", size: 11))
                }
                HStack {
                    Image("ic_faq")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("FAQ")
                        .foregroundColor(.white)
                        .font(.custom("Roboto-Regular", size: 11))
                }
            }
            
        }
    }
    
    
    
}

#Preview {
    NavigationDrawer(selectedPage: .constant(1), isOpen: true)
}
