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

    public static func px(_ value: Int) -> Self { "\(value)px" }
    public static func em(_ value: Double) -> Self { "\(value)em" }
    public static func rem(_ value: Double) -> Self { "\(value)rem" }
    public static func percent(_ value: Double) -> Self { "\(value)%" }

    public static let auto = Self("auto")
}

public struct CSSColor: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static func hex(_ hex: String) -> Self { "#\(hex)" }
    public static func rgb(_ r: Int, _ g: Int, _ b: Int) -> Self { "rgb(\(r), \(g), \(b))" }
    public static func rgba(_ r: Int, _ g: Int, _ b: Int, _ a: Double) -> Self { "rgba(\(r), \(g), \(b), \(a))" }

    public static let transparent = Self("transparent")
    public static let black = Self("black")
    public static let white = Self("white")
}

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
    public static let stretch = Self(rawValue: "stretch")
}

public struct CSSFlexWrap: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let nowrap = Self(rawValue: "nowrap")
    public static let wrap = Self(rawValue: "wrap")
    public static let wrapReverse = Self(rawValue: "wrap-reverse")
}

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

public struct CSSFlexFlow: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static func row(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.row.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.row.rawValue)
        }
    }
    public static func rowReverse(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.rowReverse.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.rowReverse.rawValue)
        }
    }
    public static func column(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.column.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.column.rawValue)
        }
    }
    public static func columnReverse(_ wrap: CSSFlexWrap? = nil) -> Self {
        if let wrap = wrap {
            return Self("\(CSSFlexDirection.columnReverse.rawValue) \(wrap.rawValue)")
        } else {
            return Self(rawValue: CSSFlexDirection.columnReverse.rawValue)
        }
    }
}

public struct CSSFlex: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static func grow(_ grow: Int = 1, shrink: Int = 1, basis: CSSLength = .auto) -> Self {
        Self("\(grow) \(shrink) \(basis.rawValue)")
    }
    public static var auto: Self {
        Self("auto")
    }
    public static var none: Self {
        Self("none")
    }
}
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

public struct CSSFontSize: Sendable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ length: CSSLength) {
        self.rawValue = length.rawValue
    }
}

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
}

//transform
public struct CSSTransform: Sendable, RawRepresentable, ExpressibleByStringInterpolation {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public static let none = Self(rawValue: "none")

    public static func translate(_ x: CSSLength, _ y: CSSLength) -> Self {
        Self("translate(\(x.rawValue),\(y.rawValue))")
    }

    public static func rotate(_ degrees: Double) -> Self {
        Self("rotate(\(degrees)deg)")
    }

    public static func scale(_ x: Double, _ y: Double) -> Self {
        Self("scale(\(x),\(y))")
    }
}
