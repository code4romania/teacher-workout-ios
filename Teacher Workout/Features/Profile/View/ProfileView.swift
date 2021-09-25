import SwiftUI

struct ProfileView: View {
    @State private var isResultsSelected: Bool = true

    var resultsDelegate: ResultsListViewDelegate?
    var settingsDelegate: SettingsListViewDelegate?

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)
                ProfilePickerView(isResultsSelected: $isResultsSelected)
                if isResultsSelected {
                    ResultsListView(delegate: self.resultsDelegate)
                } else {
                    SettingsListView(delegate: self.settingsDelegate)
                        .padding(.top, 50)
                }
            }
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
