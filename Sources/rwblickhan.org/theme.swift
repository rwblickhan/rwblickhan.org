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
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Fira/fira.css",
            ]),
            .body(
                .header(for: context.site),
                .content(index.content.body)))
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Fira/fira.css",
            ]),
            .body(
                .header(for: context.site),
                .content(section.body)))
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Fira/fira.css",
            ]),
            .body(
                .header(for: context.site),
                .content(item.body)))
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Fira/fira.css",
            ]),
            .body(
                .header(for: context.site),
                .content(page.body)))
    }

    func makeTagListHTML(for _: TagListPage, context _: PublishingContext<Site>) throws -> HTML? { nil }

    func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<Site>) throws -> HTML? { nil }
}

private extension Node where Context == HTML.BodyContext {
    static func header<T: Website>(for _: T) -> Node {
        .header(
            .div(
                .id("header-content"),
                .a(
                    .class("title"),
                    .id("header-title"),
                    .text("rwblickhan.org"),
                    .href("/index.html")),
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
                        .href("/about")))))
    }

    static func content(_ body: Content.Body) -> Node {
        .main(
            .div(
                .class("body"),
                .id("main-content"),
                .contentBody(body)))
    }
}
