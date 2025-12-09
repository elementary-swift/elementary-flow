# ElementaryCSS: Swifty styling for the web

**Define layouts and styles right in your [Elementary](https://github.com/elementary-swift/elementary) components**

🚧 Work In Progress 🚧

Motivation
+ provide in-code styling without external build steps or separate CSS style sheets
+ thread the needle between a SwiftUI feel, but a CSS function
+ do not commit to a design system or look
+ works well for server and client use cases (ie: try to save bytes on the wire, and in the binary...)
+ stay extensible and flexible (ie: no fixed overload, no enums, allow raw CSS everywhere)
+ stay composable: should work in combination with other CSS solutions (tailwind, bootstrap, ...)
+ try to cover most needs without have the base-css file explode

```swift
struct DemoPage: HTML {
    var body: some HTML {
        let cards = [
            (title: "Card 1", description: "This is the first card."),
            (title: "Card 2", description: "This is the second card."),
            (title: "Card 3", description: "This is the third card."),
        ]

        Block(.maxWidth(200), .margin(x: .auto), .fontFamily(.monospace)) {
            FlexColumn(gap: 3) {
                for card in cards {
                    Card(title: card.title, description: card.description)
                }
            }
        }
    }
}

struct Card: HTML {
    var title: String
    var description: String

    var body: some HTML {
        Block(
            .background(.background),
            .borderWidth(.px(3)),
            .borderRadius(5),
            .padding(4)
        ) {
            Paragraph(.fontSize(12), .fontWeight(.bold), .color(.primary)) {
                Text(title)
            }
            Paragraph(.fontSize(8)) {
                Text(description, .color(.secondary))
            }
        }.style(
            when: .hover,
            .background(.hoverBackground),
            .borderColor(.accent)
        )
    }
}
```

TODO:
- [ ] Figure out what to do with "Block", "Paragraph" and so on, add Heading maybe? (hard-curated params, or just "_ styles"?)
- [ ] Carefully think about other "primitives", like "Link" or "Button" (stay clean an unopinionated though)
- [ ] Add shadow, but probably introduce separate variables (a single "box-shadow" is a bit much, often you want separate control)
- [ ] Media-queries for breakpoints
- [ ] "Container" sizes? we want this? we can use CSS variables
- [ ] Make sure the display is set on Block, Text, otherwise changing the tag would case layout differences (make add a few base classes in CSS)
- [ ] think about a theme system (ie: generated CSS can use variables, swift code can pass these variables)
- [ ] think about colors in general (I'd rather not litter the space with a ton of colors, everybody wants their own...)
- [ ] think about utilities on top like overlay, ZStack, and absolute positioning in general... currently that is very CSS-y
- [ ] the CSS file generator could be parameterized (theme, breakpoints, other stuff?) and generate a more adjusted file
