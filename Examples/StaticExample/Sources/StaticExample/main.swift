import Elementary

struct Doc: HTMLDocument {
    var title: String { "Elementary UI Demo" }

    var head: some HTML {
        meta(.charset(.utf8))
        link(.rel(.stylesheet), .href("elementary-flow.css"))
    }

    var body: some HTML {
        DemoPage()
    }
}

print(Doc().render())
