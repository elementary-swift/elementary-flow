import CSSDefinitions
import Elementary

@inlinable
public func FlexRow<Tag: HTMLTagDefinition, Wrapped: HTML>(
    justify: CSSJustifyContent? = nil,
    align: CSSAlignItems? = nil,
    gap: CSSLength? = nil,
    wrap: CSSFlexWrap? = nil,
    inverse: Bool? = nil,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    let flow: CSSFlexFlow? =
        if let inverse = inverse, inverse {
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

@inlinable
public func FlexColumn<Tag: HTMLTagDefinition, Wrapped: HTML>(
    justify: CSSJustifyContent? = nil,
    align: CSSAlignItems? = nil,
    gap: CSSLength? = nil,
    wrap: CSSFlexWrap? = nil,
    inverse: Bool? = nil,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {

    let flow: CSSFlexFlow =
        if let inverse = inverse, inverse {
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
