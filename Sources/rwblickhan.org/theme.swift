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
        let linkTypographyProps =
            "prose-a:text-rwb-blue-light dark:prose-a:text-rwb-blue-dark prose-a:no-underline hover:prose-a:underline"
        return .class("\(layoutProps) \(typographyProps) \(linkTypographyProps)")
    }

    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, stylesheetPaths: [
                "/theme/styles.css",
                "/theme/pygments.css",
                "/theme/Vollkorn/vollkorn.css",
                "/theme/stork.css"
            ]),
            .body(
                .header(for: context),
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
                "/theme/stork.css"
            ]),
            .body(
                .header(for: context),
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
                "/theme/stork.css"
            ]),
            .body(
                .header(for: context),
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
                "/theme/stork.css"
            ]),
            .body(
                .header(for: context),
                .main(
                    .div(
                        makeStandardBodyClass(),
                        .contentBody(page.body)))))
    }

    func makeTagListHTML(for _: TagListPage, context _: PublishingContext<Site>) throws -> HTML? { nil }

    func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<Site>) throws -> HTML? { nil }
}

private extension Node where Context == HTML.BodyContext {
    static func header<T: Website>(for context: PublishingContext<T>) -> Node {
        .header(
            .div(
                .class("flex flex-col absolute md:fixed top-0 inset-x-0"),
                .input(.id("menu-toggle"), .class("peer hidden"), .type(.checkbox)),
                .div(
                    .class("px-4 lg:px-12 bg-black h-24 w-full flex items-center justify-between"),
                    .a(
                        .class("text-white text-4xl no-underline hover:underline"),
                        .text("rwblickhan.org"),
                        .href("/index.html")),
                    .label(
                        .class("flex flex-col h-7 justify-between cursor-pointer"),
                        .for("menu-toggle"),
                        .forEach(0..<3, { _ in
                                .div(.class("h-1 w-8 bg-white rounded"))
                        })
                    )),
                .searchBar,
                .forEach(context.sections.makeIterator(), { section in
                    sectionMenuItem(for: section)
                })))
    }
    
    static func sectionMenuItem<T: Website>(for section: Section<T>) -> Node {
        .div(
            .class("pl-4 lg:pl-12 pr-4 lg:pr-10 bg-black h-16 flex items-center justify-between hidden peer-checked:block"),
            .a(
                .class("text-white text-2xl no-underline hover:underline"),
                .text(section.content.title),
                .href(section.path)))
    }
    
    static var searchBar: Node {
        .div(
            .class("pl-4 lg:pl-12 pr-4 lg:pr-10 bg-black h-16 flex items-center justify-between hidden peer-checked:block"),
            .div(
                .class("stork-wrapper"),
                .input(.data(named: "stork", value: "federalist"), .class("stork-input")),
                .div(.data(named: "stork", value: "federalist-output"), .class("stork-output"))),
            .script(.src("/scripts/stork.js")),
            .script(.src("/scripts/register.js")))
    }
}
