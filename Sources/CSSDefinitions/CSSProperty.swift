package struct CSSProperty: Sendable {
    package let name: String
    package let variable: String
    package let defaultValue: String

    package func prefixedVariable(prefix: String? = nil) -> String {
        if let prefix = prefix {
            return "--e\(prefix)-\(variable)"
        }
        return prefixedVariable
    }

    package func className(prefix: String) -> String {
        "\(ElementaryFlowBaseClass)\(prefix)\(variable)"
    }

    package var prefixedVariable: String { "--e-\(variable)" }
}

package let ElementaryFlowBaseClass = "_e"
@usableFromInline package let ElementaryFlowFlexClass = "_ef"
@usableFromInline package let ElementaryFlowBlockClass = "_eb"

package extension CSSProperty {
    // Box Model
    static let margin = CSSProperty(name: "margin", variable: "m", defaultValue: "0")
    static let padding = CSSProperty(name: "padding", variable: "p", defaultValue: "0")
    static let background = CSSProperty(name: "background", variable: "bg", defaultValue: "transparent")

    // Border
    static let borderColor = CSSProperty(name: "border-color", variable: "bc", defaultValue: "currentColor")
    static let borderRadius = CSSProperty(name: "border-radius", variable: "br", defaultValue: "0")
    static let borderStyle = CSSProperty(name: "border-style", variable: "bs", defaultValue: "solid")
    static let borderWidth = CSSProperty(name: "border-width", variable: "bw", defaultValue: "0")

    // Sizing
    static let height = CSSProperty(name: "height", variable: "h", defaultValue: "")
    static let width = CSSProperty(name: "width", variable: "w", defaultValue: "")
    static let minHeight = CSSProperty(name: "min-height", variable: "minh", defaultValue: "")
    static let minWidth = CSSProperty(name: "min-width", variable: "minw", defaultValue: "")
    static let maxWidth = CSSProperty(name: "max-width", variable: "maxw", defaultValue: "")
    static let maxHeight = CSSProperty(name: "max-height", variable: "maxh", defaultValue: "")

    // Layout
    static let display = CSSProperty(name: "display", variable: "d", defaultValue: "revert")
    static let flexFlow = CSSProperty(name: "flex-flow", variable: "fl", defaultValue: "row")
    static let flex = CSSProperty(name: "flex", variable: "fx", defaultValue: "0 1 auto")
    static let justifyContent = CSSProperty(name: "justify-content", variable: "jc", defaultValue: "normal")
    static let alignItems = CSSProperty(name: "align-items", variable: "ai", defaultValue: "normal")
    static let alignContent = CSSProperty(name: "align-content", variable: "ac", defaultValue: "normal")
    static let gap = CSSProperty(name: "gap", variable: "g", defaultValue: "0")
    static let overflow = CSSProperty(name: "overflow", variable: "ov", defaultValue: "visible")

    // Positioning
    static let position = CSSProperty(name: "position", variable: "pn", defaultValue: "")
    static let inset = CSSProperty(name: "inset", variable: "it", defaultValue: "")
    static let zIndex = CSSProperty(name: "z-index", variable: "z", defaultValue: "")

    // Typography
    static let color = CSSProperty(name: "color", variable: "c", defaultValue: "inherit")
    static let textAlign = CSSProperty(name: "text-align", variable: "ta", defaultValue: "inherit")
    static let fontWeight = CSSProperty(name: "font-weight", variable: "fw", defaultValue: "inherit")
    static let fontSize = CSSProperty(name: "font-size", variable: "fs", defaultValue: "inherit")
    static let fontFamily = CSSProperty(name: "font-family", variable: "ff", defaultValue: "inherit")
    static let lineHeight = CSSProperty(name: "line-height", variable: "lh", defaultValue: "inherit")
    static let letterSpacing = CSSProperty(name: "letter-spacing", variable: "ls", defaultValue: "inherit")
    static let textTransform = CSSProperty(name: "text-transform", variable: "tt", defaultValue: "inherit")
    static let textDecoration = CSSProperty(name: "text-decoration", variable: "td", defaultValue: "inherit")
    static let whiteSpace = CSSProperty(name: "white-space", variable: "ws", defaultValue: "normal")
    static let textOverflow = CSSProperty(name: "text-overflow", variable: "to", defaultValue: "clip")
    static let textShadow = CSSProperty(name: "text-shadow", variable: "ts", defaultValue: "none")

    // Effects
    static let opacity = CSSProperty(name: "opacity", variable: "o", defaultValue: "1")
    static let transform = CSSProperty(name: "transform", variable: "tm", defaultValue: "none")
    static let transformOrigin = CSSProperty(name: "transform-origin", variable: "tmo", defaultValue: "center")
    static let transition = CSSProperty(name: "transition", variable: "tn", defaultValue: "none")

    // Interactivity
    static let cursor = CSSProperty(name: "cursor", variable: "cur", defaultValue: "")
}

package extension CSSProperty {
    static var all: [CSSProperty] {
        [
            // Box Model
            margin, padding, background,

            // Border
            borderColor, borderRadius, borderStyle, borderWidth,

            // Sizing
            height, width, minHeight, minWidth, maxWidth, maxHeight,

            // Layout
            display, flexFlow, flex, justifyContent, alignItems, alignContent, gap, overflow,

            // Positioning
            position, inset, zIndex,

            // Typography
            color, textAlign, fontWeight, fontSize, fontFamily,
            lineHeight, letterSpacing, textTransform, textDecoration,
            whiteSpace, textOverflow, textShadow,

            // Effects
            opacity, transform, transformOrigin, transition,

            // Interactivity
            cursor,
        ]
    }
}
