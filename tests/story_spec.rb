require "rss"

RSpec.describe RSS::Story do
	context("story building from RSS::Line<title> RSS::Line<body> RSS::Line<author>") do
		it("given <title> <body> <author> it should make a story object") do
			title = RSS::Line.new("sample title")
			body = RSS::Line.new("sample body")
			author = RSS::Line.new("JOE BIDER")
			story = RSS::Story.new(title, body, author)

			expect(story.title).to eq  title
			expect(story.body).to eq   body
			expect(story.author).to eq author
		end
	end

	context("story rendering") do
		context ("with not expanded (collapsed) story") do
			it("only render story title (with no padding)") do
				title = RSS::Line.new("sample title")
				body = RSS::Line.new("sample body")
				author = RSS::Line.new("JOE BIDER")
				story = RSS::Story.new(title, body, author)
				p = title.padding ? " " * (RSS::Padding + RSS::DefPad - 1) : " " * (RSS::DefPad-1)
				expect(story.expanded).to be(false)
				expect(story.render()[0]).to eq("#{p}+sample title")
			end
			it("only render story title (with padding)") do
				title = RSS::Line.new("sample title",true)
				body = RSS::Line.new("sample body",true)
				author = RSS::Line.new("JOE BIDER",true)
				story = RSS::Story.new(title, body, author)
				p = title.padding ? " " * (RSS::Padding + RSS::DefPad - 1) : " " * (RSS::DefPad-1)
				expect(story.expanded).to be(false)
				expect(story.render()[0]).to eq("#{p}+sample title")
			end
		end

		context ("with expanded (not collapsed) story") do
			it(<<-EOS) do
			render title then <blank line> then content <then blank> 
			line then author (with padding)
			EOS
				title = RSS::Line.new("sample title",true)
				body = RSS::Line.new("sample body",true)
				author = RSS::Line.new("JOE BIDER",true)
				story = RSS::Story.new(title, body, author)
				p = title.padding ? " " * (RSS::Padding + RSS::DefPad - 1) : " " * (RSS::DefPad-1)
				expect(story.expanded).to be(false)
				story.toggleExpand()
				expect(story.expanded).to be(true)
				expect(story.render().join("\n\n") + "\n").to eq(\
				"#{p}-sample title\n\n#{p} sample body\n\n#{p} JOE BIDER\n")
			end
		end

	end
end
