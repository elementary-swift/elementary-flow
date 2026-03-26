import Reactivity

@Reactive
final class Wisdom {
    private let randomizedIndices: [Int]
    private(set) var quotes: [WiseQuote]

    private var nextIndex: Int = 0

    var hasMoreQuotes: Bool {
        nextIndex < randomizedIndices.count
    }

    init(initialQuoteCount: Int) {
        self.randomizedIndices = (0..<WiseQuote.allQuotes.count).shuffled()
        self.quotes = randomizedIndices.prefix(initialQuoteCount).map {
            WiseQuote.allQuotes[$0]
        }
        self.nextIndex = initialQuoteCount
    }

    func addRandomQuote() {
        guard hasMoreQuotes else { return }
        let index = randomizedIndices[nextIndex]
        quotes.insert(WiseQuote.allQuotes[index], at: 0)
        nextIndex += 1
    }

    func removeQuote(_ quote: WiseQuote) {
        quotes.removeAll { $0 == quote }
    }

    func shuffle() {
        quotes.shuffle()
    }
}

struct WiseQuote: Equatable {
    let text: String
    let author: String
}

extension WiseQuote: Identifiable {
    var id: String { text }
}

extension WiseQuote {
    static let allQuotes: [WiseQuote] = [
        WiseQuote(
            text: "The only way to do great work is to love what you do.",
            author: "Steve Jobs"),
        WiseQuote(
            text: "The best way to predict the future is to invent it.",
            author: "Alan Kay"),
        WiseQuote(
            text: "In the middle of difficulty lies opportunity.",
            author: "Albert Einstein"),
        WiseQuote(
            text: "It does not matter how slowly you go as long as you do not stop.",
            author: "Confucius"),
        WiseQuote(
            text:
                "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
            author: "Ralph Waldo Emerson"),
        WiseQuote(
            text: "The only true wisdom is in knowing you know nothing.", author: "Socrates"),
        WiseQuote(
            text: "Life is what happens when you're busy making other plans.",
            author: "John Lennon"),
        WiseQuote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        WiseQuote(
            text: "Strive not to be a success, but rather to be of value.",
            author: "Albert Einstein"),
        WiseQuote(
            text: "Your time is limited, don't waste it living someone else's life.",
            author: "Steve Jobs"),
        WiseQuote(
            text: "If you want to lift yourself up, lift up someone else.",
            author: "Booker T. Washington"),
        WiseQuote(
            text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        WiseQuote(
            text: "Be the change that you wish to see in the world.", author: "Mahatma Gandhi"),
        WiseQuote(
            text: "I have not failed. I've just found 10,000 ways that won't work.",
            author: "Thomas Edison"),
        WiseQuote(
            text:
                "The best time to plant a tree was 20 years ago. The second best time is now.",
            author: "Chinese Proverb"),
        WiseQuote(
            text: "An investment in knowledge pays the best interest.",
            author: "Benjamin Franklin"),
        WiseQuote(
            text:
                "Education is the most powerful weapon which you can use to change the world.",
            author: "Nelson Mandela"),
        WiseQuote(
            text: "Simplicity is the ultimate sophistication.", author: "Leonardo da Vinci"),
        WiseQuote(text: "Talk is cheap. Show me the code.", author: "Linus Torvalds"),
        WiseQuote(
            text: "Given enough eyeballs, all bugs are shallow.", author: "Eric S. Raymond"),
        WiseQuote(
            text:
                "The most dangerous phrase in the language is: We've always done it this way.",
            author: "Grace Hopper"),
        WiseQuote(
            text: "Premature optimization is the root of all evil.", author: "Donald Knuth"),
        WiseQuote(
            text:
                "Programs must be written for people to read, and only incidentally for machines to execute.",
            author: "Harold Abelson"),
        WiseQuote(
            text:
                "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
            author: "Martin Fowler"),
        WiseQuote(
            text: "Simplicity is prerequisite for reliability.", author: "Edsger W. Dijkstra"),
        WiseQuote(
            text: "One of my most productive days was throwing away 1,000 lines of code.",
            author: "Ken Thompson"),
        WiseQuote(
            text:
                "There are only two kinds of languages: the ones people complain about and the ones nobody uses.",
            author: "Bjarne Stroustrup"),
        WiseQuote(
            text: "Code is like humor. When you have to explain it, it's bad.",
            author: "Cory House"),
        WiseQuote(
            text: "Before software can be reusable it first has to be usable.",
            author: "Ralph Johnson"),
        WiseQuote(text: "Make it work, make it right, make it fast.", author: "Kent Beck"),
        WiseQuote(
            text: "The function of good software is to make the complex appear to be simple.",
            author: "Grady Booch"),
        WiseQuote(
            text: "In real open source, you have the right to control your own destiny.",
            author: "Linus Torvalds"),
    ]
}
