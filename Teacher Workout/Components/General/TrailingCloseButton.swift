import SwiftUI

struct TrailingCloseButton: View {
    var action: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                action()
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.secondary)
            })
        }
    }
}

struct TrailingCloseButton_Previews: PreviewProvider {
    static var previews: some View {
        TrailingCloseButton {
            print("Hello")
        }
    }
}
