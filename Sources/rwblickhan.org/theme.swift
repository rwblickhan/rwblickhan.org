//
//  theme.swift
//
//
//  Created by Russell Blickhan on 1/18/20.
//

import Foundation
import Plot
import Publish

extension Theme where Site == RWBlickhanOrg {
    static var rwblickhan: Self {
        Theme(htmlFactory: RWBlickhanOrgHTMLFactory())
    }
}

private struct RWBlickhanOrgHTMLFactory<Site: Website>: HTMLFactory {
    private func makeStandardBodyClass() -> Node<HTML.BodyContext> {
        let layoutProps = "pt-32 mb-8 mx-4 md:max-w-3xl md:mx-auto"
        let typographyProps = "prose dark:prose-invert"
        let linkTypographyProps = "prose-a:text-rwb-blue-light dark:prose-a:text-rwb-blue-dark prose-a:no-underline hover:prose-a:underline"
        return .class("\(layoutProps) \(typographyProps) \(linkTypographyProps)")
    }

    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Vollkorn/vollkorn.css",
            ]),
            .body(
                .header(for: context.site),
                .main(
                    .div(
                        makeStandardBodyClass(),
                        .contentBody(index.body)))))
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Vollkorn/vollkorn.css",
            ]),
            .body(
                .header(for: context.site),
                .main(
                    makeStandardBodyClass(),
                    .contentBody(section.body),
                    .ul(
                        .forEach(section.items) { item in
                            .li(.a(.text(item.title), .href(item.path)))
                        }))))
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Vollkorn/vollkorn.css",
            ]),
            .body(
                .header(for: context.site),
                .main(
                    .div(
                        makeStandardBodyClass(),
                        .contentBody(item.body)))))
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Vollkorn/vollkorn.css",
            ]),
            .body(
                .header(for: context.site),
                .main(
                    .div(
                        makeStandardBodyClass(),
                        .contentBody(page.body)))))
    }

    func makeTagListHTML(for _: TagListPage, context _: PublishingContext<Site>) throws -> HTML? { nil }

    func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<Site>) throws -> HTML? { nil }
}

private extension Node where Context == HTML.BodyContext {
    static func header<T: Website>(for _: T) -> Node {
        .header(
            .div(
                .class("bg-black absolute md:fixed h-24 top-0 inset-x-0 flex items-center justify-between"),
                .a(
                    .class("ml-4 md:ml-12 text-white text-4xl no-underline hover:underline"),
                    .text("rwblickhan.org"),
                    .href("/index.html"))))
    }
}
