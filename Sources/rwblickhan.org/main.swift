import Foundation
import Plot
import Publish
import S3PublishDeploy
import ShellOut
import SwiftPygmentsPublishPlugin

struct RWBlickhanOrg: Website {
    enum SectionID: String, WebsiteSectionID {
        case essays
        case stories
        case technicalwriting
        case booksoftheyear = "52books"
        case filmsoftheyear = "52films"
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    var url = URL(string: "https://rwblickhan.org")!
    var name = "rwblickhan.org"
    var description = "A description of rwblickhan.org"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try RWBlickhanOrg().publish(
    withTheme: .rwblickhan,
    deployedUsing: .s3("rwblickhan.org"),
    plugins: [.pygments()])
