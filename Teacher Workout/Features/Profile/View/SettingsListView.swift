import SwiftUI

struct SettingsListView: View {
    private var viewModel = SettingsListViewModel()

    var body: some View {
        List(viewModel.availableActions, id: \.self) { item in
            SettingsListItem(title: item.titleValue)
        }.listStyle(.plain)
    }
}
