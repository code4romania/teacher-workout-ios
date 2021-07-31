import SwiftUI

protocol SignUpViewDelegate {
    func signUpViewDidTapClose(_ view: SignUpView)
    func signUpViewDidTapHaveAccount(_ view: SignUpView)
}

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    var delegate: SignUpViewDelegate

    var body: some View {
        GeometryReader { _ in
            VStack {
                TrailingCloseButton {
                    self.delegate.signUpViewDidTapClose(self)
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Creează-ți contul")
                            .largeTitleStyle()
                            .padding(.bottom)

                        SignUpFormView(viewModel: viewModel)

                        CustomDividerView(label: AppStrings.dividerLabel.rawValue.localized(), spacing: 10)
                        ProvidersView()
                            .padding(.bottom, 20)
                        ExistingAccountFooterView(delegate: self)
                    }
                }
            }
        }
        .padding(20)
        .navigationBarHidden(true)
    }
}

extension SignUpView: ExistingAccountFooterViewDelegate {
    func existingAccountFooterViewDidTapSignIn(_: ExistingAccountFooterView) {
        delegate.signUpViewDidTapHaveAccount(self)
    }
}
