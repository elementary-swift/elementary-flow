/// A CSS length value (e.g., pixels, ems, percentages).
///
/// Integer literals default to pixels: `16` becomes `"16px"`.
///
/// See [MDN: length](https://developer.mozilla.org/docs/Web/CSS/length).
public struct CSSLength: Sendable, RawRepresentable, ExpressibleByIntegerLiteral,
    ExpressibleByStringInterpolation
{
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(integerLiteral value: Int) {
        self = .px(value)
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    /// Creates a pixel length.
    public static func px(_ value: Int) -> Self { "\(value)px" }
    /// Creates an em length (relative to parent font size).
    public static func em(_ value: Double) -> Self { "\(value)em" }
    /// Creates a rem length (relative to root font size).
    public static func rem(_ value: Double) -> Self { "\(value)rem" }
    /// Creates a percentage length.
    public static func percent(_ value: Double) -> Self { "\(value)%" }
    /// Automatic sizing.
    public static let auto = Self("auto")
}

/// A CSS color value.
///
/// See [MDN: color](https://developer.mozilla.org/docs/Web/CSS/color_value).
public struct CSSColor: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    /// Creates a color from a hex string (without the `#` prefix).
    public static func hex(_ hex: String) -> Self { "#\(hex)" }
    /// Creates an RGB color.
    public static func rgb(_ r: Int, _ g: Int, _ b: Int) -> Self { "rgb(\(r), \(g), \(b))" }
    /// Creates an RGBA color with alpha transparency.
    public static func rgba(_ r: Int, _ g: Int, _ b: Int, _ a: Double) -> Self { "rgba(\(r), \(g), \(b), \(a))" }

    public static let transparent = Self("transparent")
    public static let black = Self("black")
    public static let white = Self("white")
}

/// CSS text alignment options.
///
/// See [MDN: text-align](https://developer.mozilla.org/docs/Web/CSS/text-align).
public struct CSSTextAlign: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let left = Self(rawValue: "left")
    public static let center = Self(rawValue: "center")
    public static let right = Self(rawValue: "right")
    public static let justify = Self(rawValue: "justify")
    public static let start = Self(rawValue: "start")
    public static let end = Self(rawValue: "end")
}

/// CSS positioning methods.
///
/// See [MDN: position](https://developer.mozilla.org/docs/Web/CSS/position).
public struct CSSPosition: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let `static` = Self(rawValue: "static")
    public static let relative = Self(rawValue: "relative")
    public static let absolute = Self(rawValue: "absolute")
    public static let fixed = Self(rawValue: "fixed")
    public static let sticky = Self(rawValue: "sticky")
}

/// CSS justify-content options for flex containers.
///
/// See [MDN: justify-content](https://developer.mozilla.org/docs/Web/CSS/justify-content).
public struct CSSJustifyContent: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let flexStart = Self(rawValue: "flex-start")
    public static let flexEnd = Self(rawValue: "flex-end")
    public static let start = Self(rawValue: "start")
    public static let end = Self(rawValue: "end")
    public static let center = Self(rawValue: "center")
    public static let spaceBetween = Self(rawValue: "space-between")
    public static let spaceAround = Self(rawValue: "space-around")
    public static let spaceEvenly = Self(rawValue: "space-evenly")
}

/// CSS align-items options for flex containers.
///
/// See [MDN: align-items](https://developer.mozilla.org/docs/Web/CSS/align-items).
public struct CSSAlignItems: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let flexStart = Self(rawValue: "flex-start")
    public static let flexEnd = Self(rawValue: "flex-end")
    public static let start = Self(rawValue: "start")
    public static let end = Self(rawValue: "end")
    public static let center = Self(rawValue: "center")
    public static let baseline = Self(rawValue: "baseline")
    public static let stretch = Self(rawValue: "stretch")
}

/// CSS flex-direction options.
///
/// See [MDN: flex-direction](https://developer.mozilla.org/docs/Web/CSS/flex-direction).
public struct CSSFlexDirection: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let row = Self(rawValue: "row")
    public static let rowReverse = Self(rawValue: "row-reverse")
    public static let column = Self(rawValue: "column")
    public static let columnReverse = Self(rawValue: "column-reverse")
}

/// CSS font weight values.
///
/// Integer literals are supported: `600` is equivalent to `.semiBold`.
///
/// See [MDN: font-weight](https://developer.mozilla.org/docs/Web/CSS/font-weight).
public struct CSSFontWeight: Sendable, RawRepresentable, ExpressibleByIntegerLiteral, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(integerLiteral value: IntegerLiteralType) {
        self.rawValue = String(value)
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static let thin = Self(100)
    public static let extraLight = Self(200)
    public static let light = Self(300)
    public static let normal = Self(400)
    public static let medium = Self(500)
    public static let semiBold = Self(600)
    public static let bold = Self(700)
    public static let extraBold = Self(800)
    public static let black = Self(900)
    public static let extraBlack = Self(950)
}

/// CSS align-content options for multi-line flex containers.
///
/// See [MDN: align-content](https://developer.mozilla.org/docs/Web/CSS/align-content).
public struct CSSAlignContent: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let flexStart = Self(rawValue: "flex-start")
    public static let flexEnd = Self(rawValue: "flex-end")
    public static let start = Self(rawValue: "start")
    public static let end = Self(rawValue: "end")
    public static let center = Self(rawValue: "center")
    public static let spaceBetween = Self(rawValue: "space-between")
    public static let spaceAround = Self(rawValue: "space-around")
    public static let spaceEvenly = Self(rawValue: "space-evenly")
    public static let stretch = Self(rawValue: "stretch")
}

/// CSS flex-wrap options.
///
/// See [MDN: flex-wrap](https://developer.mozilla.org/docs/Web/CSS/flex-wrap).
public struct CSSFlexWrap: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let nowrap = Self(rawValue: "nowrap")
    public static let wrap = Self(rawValue: "wrap")
    public static let wrapReverse = Self(rawValue: "wrap-reverse")
}

/// CSS display type options.
///
/// See [MDN: display](https://developer.mozilla.org/docs/Web/CSS/display).
public struct CSSDisplay: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let block = Self(rawValue: "block")
    public static let inline = Self(rawValue: "inline")
    public static let flex = Self(rawValue: "flex")
    public static let grid = Self(rawValue: "grid")
    public static let none = Self(rawValue: "none")
}

/// CSS flex-flow shorthand (direction and wrap).
///
/// See [MDN: flex-flow](https://developer.mozilla.org/docs/Web/CSS/flex-flow).
public struct CSSFlexFlow: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    /// Row direction with optional wrap.
    public static func row(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.row.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.row.rawValue)
        }
    }
    /// Reversed row direction with optional wrap.
    public static func rowReverse(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.rowReverse.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.rowReverse.rawValue)
        }
    }
    /// Column direction with optional wrap.
    public static func column(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.column.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.column.rawValue)
        }
    }
    /// Reversed column direction with optional wrap.
    public static func columnReverse(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.columnReverse.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.columnReverse.rawValue)
        }
    }
}

/// CSS flex shorthand (grow, shrink, basis).
///
/// See [MDN: flex](https://developer.mozilla.org/docs/Web/CSS/flex).
public struct CSSFlex: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    /// Configures flex grow, shrink, and basis.
    public static func grow(_ grow: Int = 1, shrink: Int = 1, basis: CSSLength = .auto) -> Self {
        Self("\(grow) \(shrink) \(basis.rawValue)")
    }
    /// Equivalent to `flex: auto` (sizes based on content, can grow and shrink).
    public static var auto: Self {
        Self("auto")
    }
    /// Equivalent to `flex: none` (inflexible, sized by content).
    public static var none: Self {
        Self("none")
    }
}
/// CSS font family values.
///
/// See [MDN: font-family](https://developer.mozilla.org/docs/Web/CSS/font-family).
public struct CSSFontFamily: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static let serif = Self("serif")
    public static let sansSerif = Self("sans-serif")
    public static let monospace = Self("monospace")
    public static let cursive = Self("cursive")
    public static let fantasy = Self("fantasy")
    public static let systemUI = Self("system-ui")
    public static let uiSansSerif = Self("ui-sans-serif")
    public static let uiSerif = Self("ui-serif")
    public static let uiMonospace = Self("ui-monospace")
    public static let uiRounded = Self("ui-rounded")
}

/// CSS font size values.
///
/// See [MDN: font-size](https://developer.mozilla.org/docs/Web/CSS/font-size).
public struct CSSFontSize: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a font size from a length value.
    public init(_ length: CSSLength) {
        self.rawValue = length.rawValue
    }
}

/// CSS overflow behavior options.
///
/// See [MDN: overflow](https://developer.mozilla.org/docs/Web/CSS/overflow).
public struct CSSOverflow: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let visible = Self(rawValue: "visible")
    public static let hidden = Self(rawValue: "hidden")
    public static let clip = Self(rawValue: "clip")
    public static let scroll = Self(rawValue: "scroll")
    public static let auto = Self(rawValue: "auto")
}

/// CSS transform origin point.
///
/// See [MDN: transform-origin](https://developer.mozilla.org/docs/Web/CSS/transform-origin).
public struct CSSTransformOrigin: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static let center = Self(rawValue: "center")
    public static let topLeft = Self(rawValue: "top left")
    public static let topRight = Self(rawValue: "top right")
    public static let bottomLeft = Self(rawValue: "bottom left")
    public static let bottomRight = Self(rawValue: "bottom right")
    public static let top = Self(rawValue: "top")
    public static let right = Self(rawValue: "right")
    public static let bottom = Self(rawValue: "bottom")
    public static let left = Self(rawValue: "left")
}

/// CSS transform functions.
///
/// See [MDN: transform](https://developer.mozilla.org/docs/Web/CSS/transform).
public struct CSSTransform: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    /// No transform.
    public static let none = Self(rawValue: "none")

    /// Translates the element by x and y.
    public static func translate(_ x: CSSLength, _ y: CSSLength) -> Self {
        Self("translate(\(x.rawValue),\(y.rawValue))")
    }

    /// Rotates the element by the specified degrees.
    public static func rotate(_ degrees: Double) -> Self {
        Self("rotate(\(degrees)deg)")
    }

    /// Scales the element by x and y factors.
    public static func scale(_ x: Double, _ y: Double) -> Self {
        Self("scale(\(x),\(y))")
    }
}

/// CSS cursor style options.
///
/// For additional cursor values, use string literals: `.cursor("zoom-in")`.
///
/// See [MDN: cursor](https://developer.mozilla.org/docs/Web/CSS/cursor).
public struct CSSCursor: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    /// Default arrow cursor.
    public static let `default` = Self(rawValue: "default")
    /// Hand pointer for clickable elements.
    public static let pointer = Self(rawValue: "pointer")
    /// Text selection cursor.
    public static let text = Self(rawValue: "text")
    /// Move/drag cursor.
    public static let move = Self(rawValue: "move")
    /// Open hand for draggable elements.
    public static let grab = Self(rawValue: "grab")
    /// Closed hand while dragging.
    public static let grabbing = Self(rawValue: "grabbing")
    /// Indicates action is not allowed.
    public static let notAllowed = Self(rawValue: "not-allowed")
    /// Loading indicator (hourglass/spinner).
    public static let wait = Self(rawValue: "wait")
    /// Loading with interaction still possible.
    public static let progress = Self(rawValue: "progress")
}
