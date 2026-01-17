import CSSDefinitions
import Elementary

// MARK: - Heading Tag Trait

/// A marker protocol for heading tags (h1-h6).
public protocol HeadingTag: HTMLTagDefinition, HTMLTrait.Paired {}

extension HTMLTag.h1: HeadingTag {}
extension HTMLTag.h2: HeadingTag {}
extension HTMLTag.h3: HeadingTag {}
extension HTMLTag.h4: HeadingTag {}
extension HTMLTag.h5: HeadingTag {}
extension HTMLTag.h6: HeadingTag {}

// MARK: - Block

/// Creates a block-level container element with optional layout parameters.
///
/// Use the `.style()` modifier for additional styling.
///
/// - Parameters:
///   - width: The element width.
///   - height: The element height.
///   - minWidth: The minimum width.
///   - maxWidth: The maximum width.
///   - minHeight: The minimum height.
///   - maxHeight: The maximum height.
///   - tag: The HTML tag to use (defaults to `div`).
///   - content: The element's content.
@inlinable
public func Block<Tag: HTMLTagDefinition, Wrapped: HTML>(
    width: CSSLength? = nil,
    height: CSSLength? = nil,
    minWidth: CSSLength? = nil,
    maxWidth: CSSLength? = nil,
    minHeight: CSSLength? = nil,
    maxHeight: CSSLength? = nil,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    var styles: [ElementaryStyle] = []
    if let width { styles.append(.width(width)) }
    if let height { styles.append(.height(height)) }
    if let minWidth { styles.append(.minWidth(minWidth)) }
    if let maxWidth { styles.append(.maxWidth(maxWidth)) }
    if let minHeight { styles.append(.minHeight(minHeight)) }
    if let maxHeight { styles.append(.maxHeight(maxHeight)) }

    return Tag.makeStyledElement(styles, elementClass: ElementaryFlowBlockClass) {
        content()
    }
}

// MARK: - Paragraph

/// Creates a paragraph element with text content.
///
/// Use the `.style()` modifier for styling.
///
/// - Parameter text: The text content.
@inlinable
public func Paragraph(_ text: String) -> HTMLElement<HTMLTag.p, HTMLText> {
    .init { HTMLText(text) }
}

/// Creates a paragraph element with custom content.
///
/// Use the `.style()` modifier for styling.
///
/// - Parameter content: The element's content.
@inlinable
public func Paragraph<Wrapped: HTML>(
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<HTMLTag.p, Wrapped> {
    .init(content: content)
}

// MARK: - Heading

/// Creates a heading element with text content at a specific level.
///
/// Use the `.style()` modifier for styling.
///
/// - Parameters:
///   - text: The text content.
///   - tag: The heading level (e.g., `HTMLTag.h2.self`).
@inlinable
public func Heading<Tag: HeadingTag>(_ text: String, tag: Tag.Type = HTMLTag.h1.self) -> HTMLElement<Tag, HTMLText> {
    .init { HTMLText(text) }
}

/// Creates a heading element with custom content.
///
/// Use the `.style()` modifier for styling.
///
/// - Parameters:
///   - tag: The heading level (defaults to `h1`).
///   - content: The element's content.
@inlinable
public func Heading<Tag: HeadingTag, Wrapped: HTML>(
    tag: Tag.Type = HTMLTag.h1.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> {
    .init(content: content)
}
