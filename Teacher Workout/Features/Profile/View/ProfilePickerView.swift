import SwiftUI

struct ProfilePickerView: View {
    @State private var isResultsSelected: Bool = false

    var body: some View {
        HStack(spacing: 0) {
            PickerTab(isSelected: isResultsSelected, title: AppStrings.Profile.resultsTabLabel.localized())
                .onTapGesture {
                    isResultsSelected = true
                }
            PickerTab(isSelected: !isResultsSelected, title: AppStrings.Profile.settingsTabLabel.localized())
                .onTapGesture {
                    isResultsSelected = false
                }
        }
        .padding(.top, 22)
        .frame(maxWidth: .infinity)
        .modifier(TextSemibold())
    }
}
