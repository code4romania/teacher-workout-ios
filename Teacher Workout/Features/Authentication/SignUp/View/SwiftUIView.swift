//
//  SwiftUIView.swift
//  Teacher Workout
//
//  Created by Vlad Stanescu on 31.07.2021.
//

import SwiftUI

struct CheckboxFieldView: View {
    @State var isSelected: Bool = false

    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.square.fill" : "checkmark.square")
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView()
    }
}
