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
            Heading(title)
                .style(.fontSize(.em(1.5)), .fontWeight(.bold))
            Paragraph(description)
                .style(.fontSize(.em(1.2)), .color(.secondary))
            input(.type(.text))
                .style(
                    .borderWidth(2),
                    .borderRadius(4),
                    .padding(y: 2)
                )
                .style(
                    when: .focus,
                    .outline(2, color: "green")
                )
            button {
                "Hello"
            }.style(
                .outline(2, color: "green"),
                .borderRadius(4),
                .padding(y: 2, x: 4),
                .minWidth(100),
                .textAlign(.center)
            )
            .style(when: .hover, .color("pink"))
            .style(when: .active, .transform(.scale(0.9, 0.9)))
        }
        .style(
            .background(.background),
            .borderWidth(.px(3)),
            .borderRadius(20),
            .padding(16),
            .color(.primary),
            .boxShadow(
                .shadow(y: 12, blur: 8, spread: -1),
                .shadow(y: 4, blur: 2)
            )
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
