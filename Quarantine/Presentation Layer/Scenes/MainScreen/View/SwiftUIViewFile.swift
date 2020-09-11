//
//  SwiftUIViewFile.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 29.08.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import SwiftUI

struct SwiftUIViewFile: View {
    var body: some View {
        Button(action: { () }, label: { Text("click") })
            .alert(isPresented: .constant(true),
                   content: { Alert(title: Text("Test")) })
    }
}

struct SwiftUIViewFile_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewFile()
    }
}
