import SwiftUI

struct ProfileView: View {
    @State private var isResultsSelected: Bool = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ProfileHeaderView(width: geometry.size.width)
                HStack {
                    PickerTab(isSelected: isResultsSelected, title: AppStrings.Profile.resultsTabLabel.localized())
                        .onTapGesture {
                            isResultsSelected = true
                        }
                    PickerTab(isSelected: !isResultsSelected, title: AppStrings.Profile.settingsTabLabel.localized())
                        .onTapGesture {
                            isResultsSelected = false
                        }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .modifier(TextSemibold())
            }
        }
        .navigationBarTitle(AppStrings.Menu.profile.localized())
    }
}
