import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet var onboardingHeroView: OnboardingHeroView!
    @IBOutlet var onboardingTitleLabel: UILabel!
    @IBOutlet var onboardingDescription: UILabel!
    @IBOutlet var nextButton: UIButton!

    var viewModel: OnboardingViewModel!

    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        setupHeroView()
        onboardingTitleLabel.text = viewModel.pageTitle
        onboardingDescription.text = viewModel.pageDescription
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        nextButton.layer.cornerRadius = 24
        nextButton.layer.borderWidth = 0.5
        nextButton.layer.borderColor = UIColor(red: 0.031, green: 0.569, blue: 0.698, alpha: 1).cgColor
    }

    private func setupHeroView() {
        onboardingHeroView.pageControl.currentPage = index
        onboardingHeroView.onboardingImageView.image = UIImage(named: viewModel.pageImage)
    }
}
