//
//  DetailViewComponent.swift
//  Ecorial-Test-SwiftUI
//
//  Created by Ingvar on 03.01.2021.
//

import SwiftUI
import SwiftUI_UDF

struct DetailViewComponent: Component {
    
    struct Props {
        var user: UserInfo
    }
    
    var props: Props
    
    var body: some View {
        Text(props.user.name)
    }
}


struct DetailViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewComponent(props: .init(user: UserInfo.fakeItem()))
    }
}
