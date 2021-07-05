import UIKit

protocol OnboardingHeroViewDelegate: AnyObject {
    func onboardingHeroView(_ view: OnboardingHeroView, didSelectPageIndex index: Int)
    func onboardingHeroViewDidPressSkip(_ view: OnboardingHeroView)
}

final class OnboardingHeroView: UIView {
    @IBOutlet var onboardingImageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var skipButton: UIButton!

    weak var delegate: OnboardingHeroViewDelegate?

    // MARK: - Actions

    @IBAction func skipButtonPressed(_: Any) {
        delegate?.onboardingHeroViewDidPressSkip(self)
    }

    @IBAction func pageControlPressed(_ sender: Any) {
        guard let control = sender as? UIPageControl else {
            return
        }

        let selectedPage = control.currentPage

        delegate?.onboardingHeroView(self, didSelectPageIndex: selectedPage)
    }
}
