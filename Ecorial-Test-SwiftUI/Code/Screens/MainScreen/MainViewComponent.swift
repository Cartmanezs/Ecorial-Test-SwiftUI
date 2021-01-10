//
//  MainViewComponent.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 02.01.2021.
//

import SwiftUI
import SwiftUI_UDF
import SwiftUI_Kit

struct MainViewComponent<AddUser: Container, DetailView: Container>: Component {
    struct Props {
        var users: [UserInfo.Id]
        var userById: (UserInfo.Id) -> UserInfo
        var addUser: AddUser
        var userContainer:(UserInfo) -> DetailView
        var usersAddedItem: [UserInfo]
    }
    
    @State private var isMainViewPresented: Bool = true
    @State private var isAddUserPresented = false
    @State private var userToDetails: UserInfo? = nil
    
    var props: Props

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLinkItem(
                    item: self.$userToDetails,
                    destination: props.userContainer
                )
                VStack {
                    headerView
                    usersView
                }
            }
            .hideNavigationBar()
        }
    }
}

extension MainViewComponent {
    var headerView: some View {
        VStack {
            HStack(spacing: 22) {
                Spacer()
                Text("My Memorials")
                Spacer()
                Button(action: $isAddUserPresented.toggleAction()) {
                    Image.addIcon
                }
                .sheetContainer(isPresented: $isAddUserPresented, container: props.addUser)
                .padding(.trailing, 20)
            }
            .padding(.leading, 60)
            .padding(.top, 20)
            
            segmentedControl
                .frame(width: 242, height: 43)
                .background(
                    RoundedCorner(radius: 14, corners: [.allCorners])
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 0.9)
                )
        }
    }
    
    var usersView: some View {
        ScrollView {
            if self.isMainViewPresented {
                usersList
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else {
                favUsersList
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
        }
    }
    
    var segmentedControl: some View {
        
        GeometryReader  { proxy in
            ZStack(alignment: isMainViewPresented ? .leading : .trailing) {
                Color.white
                Color.segmentedGray
                    .frame(width: proxy.size.width / 2, height: proxy.size.height - 4)
                    .cornerRadius(14)
                    .padding(.leading, 2)
                    .padding(.trailing, 2)
                
                HStack{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.isMainViewPresented = true
                        }
                    }) {
                        Text("Created")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(isMainViewPresented ? .white : .segmentedGray)
                    }
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.isMainViewPresented = false
                        }
                    }) {
                        Text("Favorite")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(isMainViewPresented ? .segmentedGray : .white)
                    }
                }
            }
        }
        .cornerRadius(13)
    }
    
    var usersList: some View {
        VStack(spacing: 5) {
            ForEach(props.usersAddedItem, id: \.self) { user in
                UserRowView(user: user)
                    .onTapGesture {
                        withAnimation {
                            self.userToDetails = user
                        }
                }
            }
        }
    }
    
    var favUsersList: some View {
        VStack(spacing: 5) {
            ForEach(props.usersAddedItem, id: \.self) { user in
                UserRowView(user: user)
                    .onTapGesture {
                        withAnimation {
                            self.userToDetails = user
                        }
                }
            }
        }
    }
}

// MARK: - Computed Properties
extension MainViewComponent {
    var users: [UserInfo] {
        self.props.users.compactMap { self.props.userById($0) }.filter { $0.userStatus == .none}
    }
    
    var favUsers: [UserInfo] {
        self.props.users.compactMap { self.props.userById($0) }.filter { $0.userStatus == .favorite}
    }
}

struct MainViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        MainViewComponent(props:
            .init(
                users: [],
                userById:  {_ in UserInfo.fakeItem()},
                addUser: RenderContainer(viewToRender: AddUserComponent_Previews.previews),
                userContainer: {_ in RenderContainer(viewToRender: DetailViewComponent_Previews.previews)},
                usersAddedItem: []
            )
        )
    }
}
