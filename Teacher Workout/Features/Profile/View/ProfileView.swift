import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)
                ProfilePickerView()
            }
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
