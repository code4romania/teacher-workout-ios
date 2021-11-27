import SwiftUI
import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func onboardingViewController(_ viewController: OnboardingViewController, didSelectPageIndex index: Int)
    func onboardingViewControllerDidSkip(_ viewController: OnboardingViewController)
    func onboardingViewControllerDidPressNext(_ viewController: OnboardingViewController, currentIndex index: Int)
}

final class OnboardingViewController: UIViewController, OnboardingHeroViewDelegate {
    @IBOutlet var onboardingHeroView: OnboardingHeroView!
    @IBOutlet var onboardingTitleLabel: UILabel!
    @IBOutlet var onboardingDescription: UILabel!
    @IBOutlet var nextButton: UIButton!

    weak var heroDelegate: OnboardingHeroViewDelegate?
    weak var delegate: OnboardingViewControllerDelegate?

    var viewModel: OnboardingViewModel!

    var currentPageIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingHeroView.delegate = self
        setupUI()
    }

    private func setupUI() {
        setupHeroView()
        setupNextButton()
        onboardingTitleLabel.text = viewModel.pageTitle
        onboardingDescription.text = viewModel.pageDescription
    }

    private func setupHeroView() {
        onboardingHeroView.pageControl.currentPage = currentPageIndex
        onboardingHeroView.onboardingImageView.image = UIImage(named: viewModel.pageImage)
    }

    private func setupNextButton() {
        nextButton.setTitle(viewModel.onboardingButtonTitle, for: .normal)
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        nextButton.layer.cornerRadius = 24
        nextButton.layer.borderWidth = 0.5
        nextButton.layer.borderColor = Color.accent.cgColor
    }

    // MARK: - Actions

    @IBAction func didTapNextButton(_: UIButton) {
        delegate?.onboardingViewControllerDidPressNext(self, currentIndex: currentPageIndex)
    }

    // MARK: - OnboardingHeroViewDelegate

    func onboardingHeroView(_: OnboardingHeroView, didSelectPageIndex index: Int) {
        delegate?.onboardingViewController(self, didSelectPageIndex: index)
    }

    func onboardingHeroViewDidPressSkip(_: OnboardingHeroView) {
        delegate?.onboardingViewControllerDidSkip(self)
    }
}
