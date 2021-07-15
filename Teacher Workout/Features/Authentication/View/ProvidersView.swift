import SwiftUI

struct ProvidersView: View {
    // TODO: Implement providers buttons and actions.
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                // TODO: Implement sign in with apple.
            }, label: {
                Text("Apple")
                    .primaryButtonStyle()
            })

            Button(action: {
                // TODO: Implement sign in with google.
            }, label: {
                Text("Google")
                    .primaryButtonStyle()
            })

            Button(action: {
                // TODO: Implement sign in with facebook.
            }, label: {
                Text("Facebook")
                    .primaryButtonStyle()
            })
        }
    }
}

struct ProvidersView_Previews: PreviewProvider {
    static var previews: some View {
        ProvidersView()
    }
}
