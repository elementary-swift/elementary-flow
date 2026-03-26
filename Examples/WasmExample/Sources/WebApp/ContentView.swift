import ElementaryFlow
import ElementaryUI

@View
struct ContentView {
    @State var wisdom = Wisdom(initialQuoteCount: 3)

    var body: some View {
        FlexColumn(align: .center, gap: 16) {
            TitleView()

            FlexRow(justify: .center, gap: 8) {
                Button(label: "Add Quote") {
                    wisdom.addRandomQuote()
                }

                Button(label: "Shuffle") {
                    wisdom.shuffle()
                }
            }

            QuoteList()
                .environment(wisdom)
        }.style(.fontFamily(.systemUI))
    }
}

@View
struct TitleView {
    var body: some View {
        FlexColumn(align: .center, gap: 4) {
            Heading("WISE WORDS")
                .style(
                    .fontSize(.em(2)),
                    .color(.black),
                    .fontWeight(.bold)
                )

            Paragraph {
                "This is a demo of "
                Link(text: "ElementaryFlow", url: "https://github.com/elementary-swift/elementary-flow")
                "."
            }.style(.fontSize(.em(1)))
        }.style(.padding(t: 12, b: 8))
    }
}

@View
struct QuoteCard {
    var quote: WiseQuote

    var body: some View {
        Block {
            Paragraph(quote.text)
                .style(.margin(y: 8))
            Paragraph { i { "- \(quote.author)" } }
                .style(
                    .fontSize(12),
                    .textAlign(.right)
                )
        }
        .style(
            .background(.white),
            .fontFamily(.systemUI),
            .borderWidth(1),
            .padding(16),
            .cursor(.pointer),
        )
        .style(
            when: .hover,
            .boxShadow(.shadow(y: 2, blur: 6, opacity: 0.12)),
        )
        .style(
            when: .active,
            .background(.cardActive)
        )
    }
}

@View
struct QuoteList {
    @Environment(Wisdom.self) var wisdom

    var body: some View {
        FlexColumn(gap: 8) {
            ForEach(wisdom.quotes, key: { $0.id }) { quote in
                QuoteCard(quote: quote)
                    .transition(.fade)
                    .onClick {
                        wisdom.removeQuote(quote)
                    }
            }
        }
        .style(.width(.em(20)))
        .animateContainerLayout()
        .animation(.default, value: wisdom.quotes)
    }
}

@View
struct Button {
    var label: String
    var action: () -> Void

    var body: some View {
        button {
            label
        }.onClick {
            action()
        }.style(
            .background(.buttonBackground),
            .padding(y: 16, x: 16),
            .borderWidth(1),
            .borderRadius(8),
            .cursor(.pointer),
            .transition("background 0.15s, transform 0.1s")
        )
        .style(
            when: .hover,
            .boxShadow(.ring(1, color: .black)),
        )
        .style(
            when: .active,
            .background(.buttonActive),
            .transform(.scale(0.98, 0.98))
        )
    }
}

@View
struct Link {
    var text: String
    var url: String

    var body: some View {
        a(.href(url)) { text }
    }
}

extension CSSColor {
    static var buttonBackground: Self = "#FFDDAA"
    static var buttonActive: Self = "#E0B060"
    static var cardActive: Self = "#EEEEEE"
}
