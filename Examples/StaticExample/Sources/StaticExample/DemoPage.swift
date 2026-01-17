import Elementary
import ElementaryFlow

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

extension CSSColor {
    static var primary: CSSColor { "#C2410C" }
    static var secondary: CSSColor { "#854D0E" }
    static var accent: CSSColor { "#EA580C" }
    static var background: CSSColor { "#FFF7ED" }
    static var hoverBackground: CSSColor { "#FFEDD5" }
}
