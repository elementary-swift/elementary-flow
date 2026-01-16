/// A class that generates CSS for the ElementaryUI framework
public struct ElementaryCSSStyleSheet {
    private static let prelude = "box-sizing: border-box;"

    // NOTE: This could take a config object in the future to customize the output
    public init() {}

    /// Generates the complete CSS for the ElementaryUI framework
    public func generate() -> String {
        var css = ""

        // Generate the base class
        generateBaseClass(&css)

        // Generate pseudo-class states
        for pseudoClass in CSSPseudoClass.all {
            generatePseudoClass(pseudoClass, &css)
        }

        return css
    }

    private func generateBaseClass(_ css: inout String) {
        css += ".\(ElementaryCSSBaseClass) {\n"
        css += "  \(Self.prelude)\n"

        for property in CSSProperty.all {
            css += "  \(property.prefixedVariable()):initial;\n"
        }

        for property in CSSProperty.all {
            css += "  \(property.name):var(\(property.prefixedVariable()), \(property.defaultValue));\n"
        }

        css += "}\n"

        // Element-specific base classes
        css += ".\(ElementaryCSSFlexClass) { display: flex; }\n"
        css += ".\(ElementaryCSSBlockClass) { display: block; }\n"
        css += ".\(ElementaryCSSInlineClass) { display: inline; }\n"
    }

    private func generatePseudoClass(_ pseudoClass: CSSPseudoClass, _ css: inout String) {
        for property in CSSProperty.all {
            css += ".\(property.className(prefix: pseudoClass.prefix)):\(pseudoClass.name) { "
            css += "\(property.name):var(\(property.prefixedVariable(prefix: pseudoClass.prefix)))}\n"
        }

        css += "\n"
    }
}
