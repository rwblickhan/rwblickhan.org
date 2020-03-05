//
//  theme.swift
//  
//
//  Created by Russell Blickhan on 1/18/20.
//

import Foundation
import Publish
import Plot

extension Theme where Site == RWBlickhanOrg {
    static var rwblickhan: Self {
        Theme(
            htmlFactory: RWBlickhanOrgHTMLFactory(),
            resourcePaths: ["Resources/RWBlickhanOrgTheme/styles.css"]
        )
    }
}

private struct RWBlickhanOrgHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, externalStylesheetPaths: ["https://code.cdn.mozilla.net/fonts/fira.css"]),
            .body(
                .header(for: context.site),
                .content(for: context.site)))
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body(.header(for: context.site)))
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(.header(for: context.site)))
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(.header(for: context.site)))
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? { nil }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? { nil }
}

private extension Node where Context == HTML.DocumentContext {
    static func head<T: Website>(
        for location: Location,
        on site: T,
        titleSeparator: String = " | ",
        stylesheetPaths: [Path] = ["/styles.css"],
        externalStylesheetPaths: [URLRepresentable] = [],
        rssFeedPath: Path? = .defaultForRSSFeed,
        rssFeedTitle: String? = nil
    ) -> Node {
        var title = location.title
        
        if title.isEmpty {
            title = site.name
        } else {
            title.append(titleSeparator + site.name)
        }
        
        var description = location.description
        
        if description.isEmpty {
            description = site.description
        }
        
        return .head(
            .encoding(.utf8),
            .siteName(site.name),
            .url(site.url(for: location)),
            .title(title),
            .description(description),
            .twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
            .forEach(stylesheetPaths, { .stylesheet($0) }),
            .forEach(externalStylesheetPaths, { .stylesheet($0) }),
            .viewport(.accordingToDevice),
            .unwrap(site.favicon, { .favicon($0) }),
            .unwrap(rssFeedPath, { path in
                let title = rssFeedTitle ?? "Subscribe to \(site.name)"
                return .rssFeedLink(path.absoluteString, title: title)
            }),
            .unwrap(location.imagePath ?? site.imagePath, { path in
                let url = site.url(for: path)
                return .socialImageLink(url)
            })
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func header<T: Website>(for site: T) -> Node {
        .header(
            .div(
                .id("header-content"),
                .a(
                    .class("title"),
                    .id("header-title"),
                    .text("rwblickhan.org"),
                    .href("https://rwblickhan.org")),
                .div(
                    .id("header-links"),
                    .a(
                        .class("subtitle"),
                        .id("header-newsletter"),
                        .text("Newsletter"),
                        .href("https://buttondown.email/rwblickhan")),
                    .div(.id("header-spacer")),
                    .a(
                        .class("subtitle"),
                        .id("header-about"),
                        .text("About"),
                        .href("https://rwblickhan.org/about")))))
    }
    
    static func content<T: Website>(for site: T) -> Node {
        .p(
            .class("body"),
            .id("main-content"),
            .text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar ligula vitae laoreet sollicitudin. Maecenas et orci tortor. Pellentesque varius nunc eget neque tincidunt tincidunt. Suspendisse id neque mi. Duis fringilla dui sapien, vel auctor purus fermentum ac. Praesent dignissim semper ex, non consectetur arcu. Morbi quis lobortis metus, nec consequat ligula. Sed sed elit quis turpis vulputate cursus quis id massa. Aenean sed cursus nibh. Nulla fermentum scelerisque urna, in semper dui lobortis sit amet. Cras vulputate magna vitae nisl posuere luctus. Suspendisse vel rutrum lacus. Aliquam faucibus odio mattis nulla elementum, ac blandit diam tincidunt. Etiam nec finibus lorem, sit amet commodo lorem. Ut sollicitudin libero in lacus bibendum venenatis. Aenean ipsum augue, tincidunt vel nibh at, congue efficitur tortor. Pellentesque quis sapien mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec luctus diam ac orci rhoncus, nec interdum mauris ultrices. Donec efficitur arcu eu ornare egestas. Nunc sagittis odio pretium ante venenatis, vitae laoreet libero laoreet. Suspendisse ac nulla sem. Donec et porta risus, id iaculis diam. Sed euismod venenatis mauris, a sagittis ipsum ultrices ut. Nam vitae vulputate ante. Praesent odio magna, vestibulum vitae viverra ac, elementum ut urna. Curabitur varius aliquet varius. Fusce consequat, dolor et lobortis ultrices, eros urna egestas felis, at ullamcorper felis nulla vitae lectus. Aliquam at nunc ullamcorper, iaculis metus non, convallis ex. Vestibulum dapibus eget risus sit amet aliquam. Proin scelerisque rutrum ligula a molestie. Nulla vitae luctus dolor, a accumsan quam. Fusce tempus libero interdum nulla egestas, non pulvinar leo elementum. Quisque eget dapibus urna, sit amet aliquet eros. Duis vehicula aliquet aliquam. Aliquam venenatis nisl a erat elementum, nec cursus eros scelerisque. Nulla facilisi. Nunc pretium ut nunc iaculis egestas. Nullam vitae tincidunt lectus.")
        )
    }
}
