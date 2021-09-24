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

extension DeploymentMethod {
    static func s3Cached(
        _ bucket: String,
        pathToAWSBinary awsBinary: String = "/usr/local/bin/aws",
        sync: Bool = true) -> Self {
        Self(name: "S3 \(bucket) with CloudFront cache") { context in
            try s3(bucket, pathToAWSBinary: awsBinary, sync: sync).body(context)
            try shellOut(
                to: "aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths \"/*\"")
        }
    }
}

try RWBlickhanOrg().publish(
    withTheme: .rwblickhan,
    deployedUsing: .s3Cached("rwblickhan.org"),
    plugins: [.pygments()])
