import CSSDefinitions
import Elementary

/// Creates a horizontal flex container.
/// - Parameters:
///   - justify: Horizontal alignment of items.
///   - align: Vertical alignment of items.
///   - gap: Spacing between items.
///   - wrap: Whether items wrap to new lines.
///   - reversed: If true, reverses the row direction.
///   - tag: The HTML tag to use.
///   - content: The container's content.
@inlinable
public func FlexRow<Tag: HTMLTagDefinition, Wrapped: HTML>(
    justify: CSSJustifyContent? = nil,
    align: CSSAlignItems? = nil,
    gap: CSSLength? = nil,
    wrap: CSSFlexWrap? = nil,
    reversed: Bool = false,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    let flow: CSSFlexFlow? =
        if reversed {
            .rowReverse(wrap)
        } else if let wrap = wrap {
            .row(wrap)
        } else {
            nil
        }

    return createFlexElement(
        flow: flow,
        justify: justify,
        align: align,
        gap: gap,
        tag: Tag.self,
        wrapped: content
    )
}

/// Creates a vertical flex container.
/// - Parameters:
///   - justify: Vertical alignment of items.
///   - align: Horizontal alignment of items.
///   - gap: Spacing between items.
///   - wrap: Whether items wrap to new lines.
///   - reversed: If true, reverses the column direction.
///   - tag: The HTML tag to use.
///   - content: The container's content.
@inlinable
public func FlexColumn<Tag: HTMLTagDefinition, Wrapped: HTML>(
    justify: CSSJustifyContent? = nil,
    align: CSSAlignItems? = nil,
    gap: CSSLength? = nil,
    wrap: CSSFlexWrap? = nil,
    reversed: Bool = false,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {

    let flow: CSSFlexFlow =
        if reversed {
            .columnReverse(wrap)
        } else {
            .column(wrap)
        }

    return createFlexElement(
        flow: flow,
        justify: justify,
        align: align,
        gap: gap,
        tag: Tag.self,
        wrapped: content
    )
}

@inlinable
@inline(__always)
func createFlexElement<Tag: HTMLTagDefinition, Wrapped: HTML>(
    flow: CSSFlexFlow?,
    justify: CSSJustifyContent?,
    align: CSSAlignItems?,
    gap: CSSLength?,
    tag: Tag.Type,
    @HTMLBuilder wrapped: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {

    var styles: [ElementaryStyle] = []

    if let flow = flow {
        styles.append(.flexFlow(flow))
    }
    if let justify = justify {
        styles.append(.justifyContent(justify))
    }
    if let align = align {
        styles.append(.alignItems(align))
    }
    if let gap = gap {
        styles.append(.gap(gap))
    }

    return Tag.makeStyledElement(styles, elementClass: ElementaryCSSFlexClass, content: wrapped)
}
