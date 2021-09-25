import SwiftUI

protocol SettingsListViewDelegate {
    func settingsListView(_ view: SettingsListView, didSelect item: SettingsListOption)
}

struct SettingsListView: View {
    var viewModel = SettingsListViewModel()

    var delegate: SettingsListViewDelegate?

    var body: some View {
        List(viewModel.availableActions, id: \.self) { item in
            SettingsListItem(title: item.titleValue)
                .onTapGesture {
                    delegate?.settingsListView(self, didSelect: item)
                }
        }.listStyle(PlainListStyle())
    }
}
