import SwiftUI

struct ProfileView: View {
    @State private var isResultsSelected: Bool = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)
                ProfilePickerView(isResultsSelected: $isResultsSelected)

                if !isResultsSelected {
                    SettingsListView()
                        .padding(.top, 50)
                }
            }
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
