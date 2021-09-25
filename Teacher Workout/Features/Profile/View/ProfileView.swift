import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Image("profile_image")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: geometry.size.width * 0.25)
                    .clipShape(Circle())
                Text("XP")
            }
            .frame(width: geometry.size.width)
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
