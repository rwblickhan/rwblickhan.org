import Foundation
import Plot
import Publish
import S3PublishDeploy
import ShellOut
import SwiftPygmentsPublishPlugin

struct RWBlickhanOrg: Website {
    enum SectionID: String, WebsiteSectionID {
        case books
        case films
        case recipes
        case stories
        case technical
        case tools
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    var url = URL(string: "https://rwblickhan.org")!
    var name = "rwblickhan.org"
    var description = "A description of rwblickhan.org"
    var language: Language { .english }
    var imagePath: Path? { "/images/coverimage.png" }
}

try RWBlickhanOrg().publish(
    at: nil,
    using: [
        .installPlugin(.pygments()),
        .optional(.copyResources()),
        .addMarkdownFiles(),
        .sortItems(by: \.date, order: .descending),
        .generateHTML(withTheme: .rwblickhan, indentation: nil),
        .step(named: "Apply Tailwind") { _ in
            try shellOut(
                to: "npx tailwindcss -i ./Resources/theme/styles.css -o ./Output/theme/styles.css -c tailwind.config.js")
        },
        .generateSiteMap(indentedBy: nil),
        .unwrap(.s3("rwblickhan.org"), PublishingStep.deploy),
    ])
