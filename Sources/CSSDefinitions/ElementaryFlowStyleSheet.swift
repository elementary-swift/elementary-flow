/// Generates the CSS stylesheet required for ElementaryFlow to function.
///
/// Include the generated CSS in your HTML document's `<style>` tag or as an external stylesheet.
public struct ElementaryFlowStyleSheet {
    private static let prelude = "box-sizing: border-box;"

    /// Creates a new stylesheet generator.
    public init() {}

    /// Generates the complete CSS stylesheet.
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
        css += ".\(ElementaryFlowBaseClass) {\n"
        css += "  \(Self.prelude)\n"

        for property in CSSProperty.all {
            css += "  \(property.prefixedVariable()):initial;\n"
        }

        for property in CSSProperty.all {
            css += "  \(property.name):var(\(property.prefixedVariable()), \(property.defaultValue));\n"
        }

        css += "}\n"

        // Element-specific base classes
        css += ".\(ElementaryFlowFlexClass) { display: flex; }\n"
        css += ".\(ElementaryFlowBlockClass) { display: block; }\n"
    }

    private func generatePseudoClass(_ pseudoClass: CSSPseudoClass, _ css: inout String) {
        for property in CSSProperty.all {
            css += ".\(property.className(prefix: pseudoClass.prefix)):\(pseudoClass.name) { "
            css += "\(property.name):var(\(property.prefixedVariable(prefix: pseudoClass.prefix)))}\n"
        }

        css += "\n"
    }
}
