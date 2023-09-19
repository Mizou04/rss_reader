require_relative "../lib/rss"

l = RSS::Line.new("Automata theory is the study of abstract machines and automata, as well as the computational problems that can be solved using them. It is a theory in theoretical computer science with close connections to mathematical logic. The word automata comes from the Greek word αὐτόματος, which means \"self-acting, self-willed, self-moving\"", true)

#RSS::IO_W << l.render.join("\n") << "\n"

s = RSS::Story.new(RSS::Line.new("mimi is a cat", true), l, RSS::Line.new("doggy dogg", true))

#RSS::IO_W << s.render() << "\n"
s.toggleExpand()
RSS::IO_W << s.render().join("\n\n") << "\n"
