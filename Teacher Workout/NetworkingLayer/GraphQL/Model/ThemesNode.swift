import Foundation

typealias ThemeNode = ThemesQuery.Data.Theme.Edge.Node

extension Theme {
    init?(themeNode: ThemeNode?) {
        guard let theme = themeNode else {
            return nil
        }

        id = theme.id ?? UUID().uuidString
        title = theme.title
        imageURL = theme.thumbnail.url
    }
}
