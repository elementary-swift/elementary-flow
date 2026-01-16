import CSSDefinitions
import Elementary

// TODO: complete this and add most likey parameters here

@inlinable
public func Block<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryCSSBlockClass) {
        content()
    }
}

@inlinable
public func Inline<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.span.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryCSSInlineClass) {
        content()
    }
}

@inlinable
public func Paragraph<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.p.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryCSSBlockClass) {
        content()
    }
}

@inlinable
public func Heading<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.h1.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryCSSBlockClass) {
        content()
    }
}
