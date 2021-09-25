import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ProfileHeaderView(width: geometry.size.width)
            }
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
