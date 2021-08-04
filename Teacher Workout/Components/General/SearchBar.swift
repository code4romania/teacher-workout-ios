import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField(AppStrings.Search.placeholder.localized(), text: $text)
                .foregroundColor(Color("AccentColor"))
                .font(Font.custom("Mulish-SemiBold", size: 16))
                .frame(height: 40)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.white))
                .cornerRadius(8)

                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )

                .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color("secondaryColor"), style: StrokeStyle(lineWidth: 1.0)))
                .padding(.horizontal, 12)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text(AppStrings.Search.cancelButton.localized())
                }
                .padding(.trailing, 16)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
