import SwiftUI

struct ChangePasswordView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)
            }
        }
        .navigationTitle(Text(AppStrings.ChangePassword.navigationTitle.localized()))
    }
}
