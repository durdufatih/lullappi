//
//  AlertView.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 20.02.2023.
//

import SwiftUI

struct AlertView: View {
    @State private var selectedStrength: String = ""
    @State private var askForStrength: String = ""
    @State private var ask: Bool = false
    let strengths = ["1","2","3"]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
