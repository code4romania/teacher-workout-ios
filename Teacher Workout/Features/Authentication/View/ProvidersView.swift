import SwiftUI

struct ProvidersView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                print("signing in")
            }, label: {
                Text("Apple")
                    .primaryButtonStyle()
            })

            Button(action: {
                print("signing in")
            }, label: {
                Text("Google")
                    .primaryButtonStyle()
            })

            Button(action: {
                print("signing in")
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
