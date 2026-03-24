import Elementary
import Testing

@testable import ElementaryFlow

private struct TestDocument<Content: HTML>: HTMLDocument {
    typealias Tag = Never
    let element: Content

    var title: String { "Test" }
    var head: some HTML {}
    var body: some HTML { element }
}

private func render<Content: HTML>(_ content: Content) -> String {
    TestDocument(element: content).render()
}

@Test func blockAppliesBlockClassAndSizeStyles() {
    let html = render(
        Block(width: 100, maxWidth: 800) {
            Paragraph("Body")
        }
    )

    #expect(html.contains("_eb"))
    #expect(html.contains("--e-w"))
    #expect(html.contains("100px"))
    #expect(html.contains("--e-maxw"))
    #expect(html.contains("800px"))
}

@Test func flexRowAppliesFlowAlignmentAndGap() {
    let html = render(
        FlexRow(
            justify: .spaceBetween,
            align: .center,
            gap: .px(12),
            wrap: .wrap
        ) {
            Paragraph("A")
        }
    )

    #expect(html.contains("_ef"))
    #expect(html.contains("--e-fl"))
    #expect(html.contains("row wrap"))
    #expect(html.contains("--e-jc"))
    #expect(html.contains("space-between"))
    #expect(html.contains("--e-ai"))
    #expect(html.contains("center"))
    #expect(html.contains("--e-g"))
    #expect(html.contains("12px"))
}

@Test func styleWhenHoverUsesConditionalClassAndVariables() {
    let html = render(
        Paragraph("Hover me")
            .style(when: .hover, .background("pink"), .color("red"))
    )

    #expect(html.contains("_ehbg"))
    #expect(html.contains("_ehc"))
    #expect(html.contains("--eh-bg"))
    #expect(html.contains("pink"))
    #expect(html.contains("--eh-c"))
    #expect(html.contains("red"))
}

@Test func headingAndParagraphRenderExpectedTags() {
    let html = render(
        Block {
            Heading("Title", tag: HTMLTag.h2.self)
            Paragraph("Description")
        }
    )

    #expect(html.contains("<h2>Title</h2>"))
    #expect(html.contains("<p>Description</p>"))
}
