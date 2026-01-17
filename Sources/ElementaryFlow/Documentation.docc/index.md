# ``ElementaryFlow``

Layout and styling for Elementary - SwiftUI feel, CSS function.

## Overview

Define layouts and styles right in your [ElementaryUI](https://github.com/elementary-swift/elementary-ui) or [Elementary](https://github.com/elementary-swift/elementary) components — no external build tools or separate stylesheets required. ElementaryFlow provides a Swift-native API that stays true to CSS, with type-checked properties, conditional styles for hover and focus states, and seamless composition with other CSS frameworks.

```swift
struct DemoPage: HTML {
    var body: some HTML {
        let cards = [
            (title: "Card 1", description: "This is the first card."),
            (title: "Card 2", description: "This is the second card."),
            (title: "Card 3", description: "This is the third card."),
        ]

        Block(.maxWidth(800), .margin(x: .auto), .fontFamily(.monospace)) {
            Heading(
                .fontSize(24),
                .fontWeight(.bold),
                .color(.secondary),
                .padding(y: 16)
            ) {
                "DEMO PAGE"
            }

            FlexColumn(gap: 12) {
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
            .padding(16)
        ) {
            Paragraph(.fontSize(.em(1.5)), .fontWeight(.bold), .color(.primary)) {
                title
            }
            Paragraph(.fontSize(.em(1.2)), .color(.secondary)) {
                description
            }
        }.style(
            when: .hover,
            .background(.hoverBackground),
            .borderColor(.accent)
        )
    }
}
```