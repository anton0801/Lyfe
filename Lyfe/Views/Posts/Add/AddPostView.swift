import SwiftUI

struct AddPostView: View {
    
    @Environment(\.presentationMode) var presMode
    
    @State var postText = ""
    @FocusState var focused: Bool?
    
    @State var explicitContent = false
    @State var bestFriends = false
    
    @StateObject var addPostVm = AddPostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .font(.custom("Roboto-Regular", size: 18))
                        .foregroundColor(.white)
                }
                Spacer()
                
                Button {
                    Task {
                        do {
                            try await addPostVm.createTextPost(text: postText, bestFriends: bestFriends, explicitContent: explicitContent)
                        } catch {
                            
                        }
                    }
                } label: {
                    Text("Publish")
                        .font(.custom("Roboto-Bold", size: 18))
                        .foregroundColor(.mainBackground)
                        .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                        .background(Color.white)
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $postText)
                    .focused($focused, equals: true)
                    .placeholder(when: postText.isEmpty) {
                        Text("What's new ?")
                            .foregroundColor(.strokeColor)
                            .font(.custom("Roboto-Regular", size: 16))
                            .offset(y: -155)
                    }
                    .lineLimit(20)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .foregroundColor(.primaryTextColor)
                    .frame(width: UIScreen.main.bounds.width)
                    .scrollContentBackground(.hidden)
//                TextField("", text: $postText)
//                    .focused($focused, equals: true)
//                    .placeholder(when: postText.isEmpty) {
//                        Text("What's new ?")
//                            .foregroundColor(.strokeColor)
//                            .font(.custom("Roboto-Regular", size: 16))
//                            .multilineTextAlignment(.leading)
//                    }
//                    .lineLimit(20)
//                    .multilineTextAlignment(.leading)
//                    .padding(.horizontal)
//                    .foregroundColor(.primaryTextColor)
//                    .frame(width: UIScreen.main.bounds.width)
            }
            .frame(height: 350, alignment: .topLeading)
            
            Rectangle()
                .fill(Color.lineColor)
                .frame(height: 1)
            
            HStack {
                Button {
                    
                } label: {
                    Image("gallery")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                Button {
                    
                } label: {
                    Image("video_stroke")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 24)
                Button {
                    
                } label: {
                    Image("instagram")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 24)
            
                Rectangle()
                    .fill(Color.lineColor)
                    .frame(width: 2, height: 24)
                    .padding(.leading, 24)
                
                Button {
                    
                } label: {
                    Image("user_add")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 24)
                
                Button {
                    
                } label: {
                    Image("comment_slash")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 24)
                
                Button {
                    withAnimation {
                        explicitContent.toggle()
                    }
                } label: {
                    if explicitContent {
                        Image("explicit_content")
                            .resizable()
                            .frame(width: 24, height: 24)
                    } else {
                        Image("explicit_content")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.leading, 24)
                Spacer()
            }
            .padding([.top, .horizontal])
            
            Spacer()
        }
        .background(
            Rectangle()
                .fill(Color.mainBackground)
                .frame(minWidth: UIScreen.main.bounds.width,
                       minHeight: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
        .onAppear {
            self.focused = true
        }
    }
}

#Preview {
    AddPostView()
}
