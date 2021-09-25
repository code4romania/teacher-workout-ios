import SwiftUI

struct ProfileView: View {
    @State private var isResultsSelected: Bool = false

    var delegate: SettingsListViewDelegate?

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)
                ProfilePickerView(isResultsSelected: $isResultsSelected)
                if isResultsSelected {
                    ResultsListView()
                } else {
                    SettingsListView(delegate: self.delegate)
                        .padding(.top, 50)
                }
            }
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
