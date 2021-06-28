import UIKit

protocol OnboardingViewControllerDelegate {
    func onboardingViewController(_ viewController: OnboardingViewController, didSelectPageIndex index: Int)
    func onboardingViewControllerDidSkip(_ viewController: OnboardingViewController)
    func onboardingViewControllerDidPressNext(_ viewController: OnboardingViewController, currentIndex index: Int)
}

final class OnboardingViewController: UIViewController, OnboardingHeroViewDelegate {
    @IBOutlet var onboardingHeroView: OnboardingHeroView!
    @IBOutlet var onboardingTitleLabel: UILabel!
    @IBOutlet var onboardingDescription: UILabel!
    @IBOutlet var nextButton: UIButton!

    var heroDelegate: OnboardingHeroViewDelegate?
    var delegate: OnboardingViewControllerDelegate?

    var viewModel: OnboardingViewModel!

    var currentPageIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingHeroView.delegate = self
        setupUI()
    }

    private func setupUI() {
        setupHeroView()
        onboardingTitleLabel.text = viewModel.pageTitle
        onboardingDescription.text = viewModel.pageDescription
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        nextButton.layer.cornerRadius = 24
        nextButton.layer.borderWidth = 0.5
        nextButton.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
    }

    private func setupHeroView() {
        onboardingHeroView.pageControl.currentPage = currentPageIndex
        onboardingHeroView.onboardingImageView.image = UIImage(named: viewModel.pageImage)
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
