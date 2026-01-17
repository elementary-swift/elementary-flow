import CSSDefinitions

/// A CSS style that can be applied to HTML elements.
public struct ElementaryStyle: Sendable {
    internal var property: CSSProperty
    internal var value: String

    init(property: CSSProperty, value: String) {
        self.property = property
        self.value = value
    }

    init(property: CSSProperty, value: some RawRepresentable<String>) {
        self.property = property
        self.value = value.rawValue
    }
}

extension ElementaryStyle {
    /// A condition under which styles are applied, such as hover or focus states.
    public struct Condition: Sendable {
        enum Value {
            case pseudoClass(CSSPseudoClass)
        }
        var value: Value

        init(_ value: Value) {
            self.value = value
        }

        var className: String {
            switch value {
            case .pseudoClass(let pseudoClass):
                pseudoClass.className
            }
        }

        var prefix: String {
            switch value {
            case .pseudoClass(let pseudoClass):
                pseudoClass.prefix
            }
        }
    }
}

public extension ElementaryStyle.Condition {
    /// Applies styles when the element is hovered.
    static var hover: Self { Self(.pseudoClass(.hover)) }
    /// Applies styles when the element is active (being clicked).
    static var active: Self { Self(.pseudoClass(.active)) }
    /// Applies styles when the element has focus.
    static var focus: Self { Self(.pseudoClass(.focus)) }
    /// Applies styles when the element is disabled.
    static var disabled: Self { Self(.pseudoClass(.disabled)) }
}

extension ElementaryStyle {
    // MARK: - Box Model

    /// Sets the margin on all sides.
    ///
    /// See [MDN: margin](https://developer.mozilla.org/docs/Web/CSS/margin).
    public static func margin(_ value: CSSLength) -> Self {
        Self(property: .margin, value: value)
    }
    /// Sets the margin for each side individually (top, right, bottom, left).
    public static func margin(t: CSSLength = 0, r: CSSLength = 0, b: CSSLength = 0, l: CSSLength = 0) -> Self {
        Self(property: .margin, value: "\(t.rawValue) \(r.rawValue) \(b.rawValue) \(l.rawValue)")
    }
    /// Sets the margin for vertical (y) and horizontal (x) axes.
    public static func margin(y: CSSLength = 0, x: CSSLength = 0) -> Self {
        Self(property: .margin, value: "\(y.rawValue) \(x.rawValue)")
    }
    /// Sets the padding on all sides.
    ///
    /// See [MDN: padding](https://developer.mozilla.org/docs/Web/CSS/padding).
    public static func padding(_ value: CSSLength) -> Self {
        Self(property: .padding, value: value)
    }
    /// Sets the padding for each side individually (top, right, bottom, left).
    public static func padding(t: CSSLength = 0, r: CSSLength = 0, b: CSSLength = 0, l: CSSLength = 0) -> Self {
        Self(property: .padding, value: "\(t.rawValue) \(r.rawValue) \(b.rawValue) \(l.rawValue)")
    }
    /// Sets the padding for vertical (y) and horizontal (x) axes.
    public static func padding(y: CSSLength = 0, x: CSSLength = 0) -> Self {
        Self(property: .padding, value: "\(y.rawValue) \(x.rawValue)")
    }
    /// Sets the background color.
    ///
    /// See [MDN: background](https://developer.mozilla.org/docs/Web/CSS/background).
    public static func background(_ value: CSSColor) -> Self {
        Self(property: .background, value: value)
    }

    // MARK: - Border

    /// Sets the border color.
    ///
    /// See [MDN: border-color](https://developer.mozilla.org/docs/Web/CSS/border-color).
    public static func borderColor(_ value: CSSColor) -> Self {
        Self(property: .borderColor, value: value)
    }
    /// Sets the border radius for rounded corners.
    ///
    /// See [MDN: border-radius](https://developer.mozilla.org/docs/Web/CSS/border-radius).
    public static func borderRadius(_ value: CSSLength) -> Self {
        Self(property: .borderRadius, value: value)
    }
    /// Sets the border style (e.g., "solid", "dashed", "dotted").
    ///
    /// See [MDN: border-style](https://developer.mozilla.org/docs/Web/CSS/border-style).
    public static func borderStyle(_ value: String) -> Self {
        Self(property: .borderStyle, value: value)
    }
    /// Sets the border width on all sides.
    ///
    /// See [MDN: border-width](https://developer.mozilla.org/docs/Web/CSS/border-width).
    public static func borderWidth(_ value: CSSLength) -> Self {
        Self(property: .borderWidth, value: value)
    }
    /// Sets the border width for each side individually (top, right, bottom, left).
    public static func borderWidth(t: CSSLength = 0, r: CSSLength = 0, b: CSSLength = 0, l: CSSLength = 0) -> Self {
        Self(property: .borderWidth, value: "\(t.rawValue) \(r.rawValue) \(b.rawValue) \(l.rawValue)")
    }
    /// Sets the border width for vertical (y) and horizontal (x) axes.
    public static func borderWidth(y: CSSLength = 0, x: CSSLength = 0) -> Self {
        Self(property: .borderWidth, value: "\(y.rawValue) \(x.rawValue)")
    }

    // MARK: - Sizing

    /// Sets the element height.
    ///
    /// See [MDN: height](https://developer.mozilla.org/docs/Web/CSS/height).
    public static func height(_ value: CSSLength) -> Self {
        Self(property: .height, value: value)
    }
    /// Sets the element width.
    ///
    /// See [MDN: width](https://developer.mozilla.org/docs/Web/CSS/width).
    public static func width(_ value: CSSLength) -> Self {
        Self(property: .width, value: value)
    }
    /// Sets the minimum height.
    ///
    /// See [MDN: min-height](https://developer.mozilla.org/docs/Web/CSS/min-height).
    public static func minHeight(_ value: CSSLength) -> Self {
        Self(property: .minHeight, value: value)
    }
    /// Sets the minimum width.
    ///
    /// See [MDN: min-width](https://developer.mozilla.org/docs/Web/CSS/min-width).
    public static func minWidth(_ value: CSSLength) -> Self {
        Self(property: .minWidth, value: value)
    }
    /// Sets the maximum height.
    ///
    /// See [MDN: max-height](https://developer.mozilla.org/docs/Web/CSS/max-height).
    public static func maxHeight(_ value: CSSLength) -> Self {
        Self(property: .maxHeight, value: value)
    }
    /// Sets the maximum width.
    ///
    /// See [MDN: max-width](https://developer.mozilla.org/docs/Web/CSS/max-width).
    public static func maxWidth(_ value: CSSLength) -> Self {
        Self(property: .maxWidth, value: value)
    }

    // MARK: - Layout

    /// Sets the display type.
    ///
    /// See [MDN: display](https://developer.mozilla.org/docs/Web/CSS/display).
    public static func display(_ value: CSSDisplay) -> Self {
        Self(property: .display, value: value)
    }
    /// Sets the flex direction and wrap behavior.
    ///
    /// See [MDN: flex-flow](https://developer.mozilla.org/docs/Web/CSS/flex-flow).
    public static func flexFlow(_ value: CSSFlexFlow) -> Self {
        Self(property: .flexFlow, value: value)
    }
    /// Sets horizontal alignment of flex items along the main axis.
    ///
    /// See [MDN: justify-content](https://developer.mozilla.org/docs/Web/CSS/justify-content).
    public static func justifyContent(_ value: CSSJustifyContent) -> Self {
        Self(property: .justifyContent, value: value)
    }
    /// Sets vertical alignment of flex items along the cross axis.
    ///
    /// See [MDN: align-items](https://developer.mozilla.org/docs/Web/CSS/align-items).
    public static func alignItems(_ value: CSSAlignItems) -> Self {
        Self(property: .alignItems, value: value)
    }
    /// Sets alignment of flex lines when there is extra space on the cross axis.
    ///
    /// See [MDN: align-content](https://developer.mozilla.org/docs/Web/CSS/align-content).
    public static func alignContent(_ value: CSSAlignContent) -> Self {
        Self(property: .alignContent, value: value)
    }
    /// Sets the gap between flex or grid items.
    ///
    /// See [MDN: gap](https://developer.mozilla.org/docs/Web/CSS/gap).
    public static func gap(_ value: CSSLength) -> Self {
        Self(property: .gap, value: value)
    }
    /// Sets how a flex item grows or shrinks to fit available space.
    ///
    /// See [MDN: flex](https://developer.mozilla.org/docs/Web/CSS/flex).
    public static func flex(_ value: CSSFlex) -> Self {
        Self(property: .flex, value: value)
    }
    /// Sets how content overflow is handled.
    ///
    /// See [MDN: overflow](https://developer.mozilla.org/docs/Web/CSS/overflow).
    public static func overflow(_ value: CSSOverflow) -> Self {
        Self(property: .overflow, value: value)
    }

    // MARK: - Positioning

    /// Sets the positioning method.
    ///
    /// See [MDN: position](https://developer.mozilla.org/docs/Web/CSS/position).
    public static func position(_ value: CSSPosition) -> Self {
        Self(property: .position, value: value)
    }
    /// Sets the inset (top, right, bottom, left) on all sides.
    ///
    /// See [MDN: inset](https://developer.mozilla.org/docs/Web/CSS/inset).
    public static func inset(_ value: CSSLength) -> Self {
        Self(property: .inset, value: value)
    }
    /// Sets the inset for each side individually (top, right, bottom, left).
    public static func inset(t: CSSLength = .auto, r: CSSLength = .auto, b: CSSLength = .auto, l: CSSLength = .auto) -> Self {
        Self(property: .inset, value: "\(t.rawValue) \(r.rawValue) \(b.rawValue) \(l.rawValue)")
    }
    /// Sets the inset for vertical (y) and horizontal (x) axes.
    public static func inset(y: CSSLength = .auto, x: CSSLength = .auto) -> Self {
        Self(property: .inset, value: "\(y.rawValue) \(x.rawValue)")
    }
    /// Sets the z-index (stacking order).
    ///
    /// See [MDN: z-index](https://developer.mozilla.org/docs/Web/CSS/z-index).
    public static func zIndex(_ value: Int) -> Self {
        Self(property: .zIndex, value: "\(value)")
    }

    // MARK: - Typography

    /// Sets the text color.
    ///
    /// See [MDN: color](https://developer.mozilla.org/docs/Web/CSS/color).
    public static func color(_ value: CSSColor) -> Self {
        Self(property: .color, value: value)
    }
    /// Sets the text alignment.
    ///
    /// See [MDN: text-align](https://developer.mozilla.org/docs/Web/CSS/text-align).
    public static func textAlign(_ value: CSSTextAlign) -> Self {
        Self(property: .textAlign, value: value)
    }
    /// Sets the font weight.
    ///
    /// See [MDN: font-weight](https://developer.mozilla.org/docs/Web/CSS/font-weight).
    public static func fontWeight(_ value: CSSFontWeight) -> Self {
        Self(property: .fontWeight, value: value)
    }
    /// Sets the font size using a length value.
    ///
    /// See [MDN: font-size](https://developer.mozilla.org/docs/Web/CSS/font-size).
    public static func fontSize(_ value: CSSLength) -> Self {
        Self(property: .fontSize, value: value)
    }
    /// Sets the font size using a predefined size.
    public static func fontSize(_ value: CSSFontSize) -> Self {
        Self(property: .fontSize, value: value)
    }
    /// Sets the font family.
    ///
    /// See [MDN: font-family](https://developer.mozilla.org/docs/Web/CSS/font-family).
    public static func fontFamily(_ value: CSSFontFamily) -> Self {
        Self(property: .fontFamily, value: value)
    }
    /// Sets the line height.
    ///
    /// See [MDN: line-height](https://developer.mozilla.org/docs/Web/CSS/line-height).
    public static func lineHeight(_ value: CSSLength) -> Self {
        Self(property: .lineHeight, value: value)
    }
    /// Sets the letter spacing.
    ///
    /// See [MDN: letter-spacing](https://developer.mozilla.org/docs/Web/CSS/letter-spacing).
    public static func letterSpacing(_ value: CSSLength) -> Self {
        Self(property: .letterSpacing, value: value)
    }
    /// Sets the text transform (e.g., "uppercase", "lowercase", "capitalize").
    ///
    /// See [MDN: text-transform](https://developer.mozilla.org/docs/Web/CSS/text-transform).
    public static func textTransform(_ value: String) -> Self {
        Self(property: .textTransform, value: value)
    }
    /// Sets the text decoration (e.g., "underline", "line-through", "none").
    ///
    /// See [MDN: text-decoration](https://developer.mozilla.org/docs/Web/CSS/text-decoration).
    public static func textDecoration(_ value: String) -> Self {
        Self(property: .textDecoration, value: value)
    }
    /// Sets how whitespace is handled (e.g., "nowrap", "pre", "pre-wrap").
    ///
    /// See [MDN: white-space](https://developer.mozilla.org/docs/Web/CSS/white-space).
    public static func whiteSpace(_ value: String) -> Self {
        Self(property: .whiteSpace, value: value)
    }
    /// Sets how text overflow is handled (e.g., "ellipsis", "clip").
    ///
    /// See [MDN: text-overflow](https://developer.mozilla.org/docs/Web/CSS/text-overflow).
    public static func textOverflow(_ value: String) -> Self {
        Self(property: .textOverflow, value: value)
    }
    /// Sets the text shadow.
    ///
    /// See [MDN: text-shadow](https://developer.mozilla.org/docs/Web/CSS/text-shadow).
    public static func textShadow(_ value: String) -> Self {
        Self(property: .textShadow, value: value)
    }

    // MARK: - Effects

    /// Sets the opacity (0.0 to 1.0).
    ///
    /// See [MDN: opacity](https://developer.mozilla.org/docs/Web/CSS/opacity).
    public static func opacity(_ value: Double) -> Self {
        Self(property: .opacity, value: "\(value)")
    }
    /// Sets a transform (translate, rotate, scale).
    ///
    /// See [MDN: transform](https://developer.mozilla.org/docs/Web/CSS/transform).
    public static func transform(_ value: CSSTransform) -> Self {
        Self(property: .transform, value: value)
    }
    /// Sets the transform origin point.
    ///
    /// See [MDN: transform-origin](https://developer.mozilla.org/docs/Web/CSS/transform-origin).
    public static func transformOrigin(_ value: CSSTransformOrigin) -> Self {
        Self(property: .transformOrigin, value: value)
    }
    /// Sets the transition animation.
    ///
    /// See [MDN: transition](https://developer.mozilla.org/docs/Web/CSS/transition).
    public static func transition(_ value: String) -> Self {
        Self(property: .transition, value: value)
    }

    // MARK: - Interactivity

    /// Sets the cursor style.
    ///
    /// See [MDN: cursor](https://developer.mozilla.org/docs/Web/CSS/cursor).
    public static func cursor(_ value: CSSCursor) -> Self {
        Self(property: .cursor, value: value)
    }
}
