<p align="center">
  <a href="https://elementary.codes">
    <img src="https://elementary-swift.github.io/assets/elementary-logo.svg" width="125px" alt="Elementary Logo">
  </a>
</p>

# ElementaryFlow — Layout and styling in Swift

***SwiftUI feel, CSS function.***

Define layouts and styles right in your [ElementaryUI](https://github.com/elementary-swift/elementary-ui) or [Elementary](https://github.com/elementary-swift/elementary) components — no external build tools or separate stylesheets required. ElementaryFlow provides a Swift-native API that maps efficiently to CSS, with type-checked properties, conditional styles for hover and focus states, and seamless composition with other CSS frameworks.

```swift
struct DemoPage: HTML {
    var body: some HTML {
        let cards = [
            (title: "Card 1", description: "This is the first card."),
            (title: "Card 2", description: "This is the second card."),
            (title: "Card 3", description: "This is the third card."),
        ]

        Block(maxWidth: 800) {
            Heading("DEMO PAGE")
                .style(
                    .fontSize(24),
                    .fontWeight(.bold),
                    .color(.secondary),
                    .padding(y: 16)
                )

            FlexColumn(gap: 12) {
                for card in cards {
                    Card(title: card.title, description: card.description)
                }
            }
        }
        .style(.margin(x: .auto), .fontFamily(.monospace))
    }
}

struct Card: HTML {
    var title: String
    var description: String

    var body: some HTML {
        Block {
            Paragraph(title)
                .style(.fontSize(.em(1.5)), .fontWeight(.bold), .color(.primary))
            Paragraph(description)
                .style(.fontSize(.em(1.2)), .color(.secondary))
        }
        .style(
            .background(.background),
            .borderWidth(.px(3)),
            .borderRadius(5),
            .padding(16)
        )
        .style(
            when: .hover,
            .background(.hoverBackground),
            .borderColor(.accent)
        )
    }
}
```

## Demo

Check out a simple demo app [here](https://elementary-swift.github.io/elementary-flow/). ([source code](./Examples/WasmExample))

## How to use it

The package contains a single, static CSS file that must be loaded for ElementaryFlow to work: [css/elementary-flow.css](css/elementary-flow.css).

Make sure to bundle this file as part of your web project build. If you're using [ElementaryUI](https://github.com/elementary-swift/elementary-ui),
1. Create an `"ElementaryFlow"` alias in `vite.config.ts` resolving to the provided css/elementary-flow.css ([like so](https://github.com/elementary-swift/elementary-ui/blob/main/Examples/Swiftle/vite.config.ts#L8)).
2. Create a CSS file for your web app that contains the line `@import "ElementaryFlow";`.
3. Add a stylesheet `<link>` to your CSS file in `index.html`.

*More docs and guides coming soon...*

## Top-level types

- `FlexRow`: Horizontal flex container for laying out children in a row, with optional alignment, spacing, wrapping, and reverse direction.
- `FlexColumn`: Vertical flex container for stacking children in a column, with optional alignment, spacing, wrapping, and reverse direction.
- `Block`: Generic block-level container (defaults to `div`) with optional sizing constraints like width/height and min/max values.
- `Paragraph`: Text or custom-content paragraph element (`p`).
- `Heading`: Semantic heading (`h1`-`h6`) for titles and section labels.

## Style modifier

Use `.style(...)` to attach one or more CSS-like style values directly to an element in Swift. You can chain multiple `.style(...)` calls to keep base layout and visual details separate.

## `when:` parameter

Use `when:` inside `.style(...)` to apply styles only in a specific state (for example `.hover` or `.focus`). This keeps conditional styling colocated with base styles while still mapping to CSS behavior.

## 🚧 Work In Progress 🚧

Motivation
+ provide in-code styling without external build steps or separate CSS style sheets
+ thread the needle between a SwiftUI feel, but a CSS function
+ do not commit to a design system or look
+ works well for server and client use cases (ie: try to save bytes on the wire, and in the binary...)
+ stay extensible and flexible (ie: no fixed overload, no enums, allow raw CSS everywhere)
+ stay composable: should work in combination with other CSS solutions (tailwind, bootstrap, ...)
+ try to cover most needs without having the base-css file explode
