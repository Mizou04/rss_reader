module RSS
	class Story
		attr_reader :title, :body, :author, :expanded
		def initialize(title, body, author)
			@title = title
			@body = body
			@author = author
			@expanded = false
			@symbol = @expanded ? "-" : "+"
		end

		def toggleExpand()
			@expanded = !@expanded
			@symbol = @expanded ? "-" : "+"
		end

		def render
			p = @title.padding ? Padding + DefPad - 1 : DefPad - 1
			_title    = @title.render.join("\n")
			_body     = @body.render.join("\n")
			_author   = @author.render.join("\n")
			_title[p] = @symbol

			if(!@expanded)
				return [_title]
			end

			return [_title, _body, _author]
		end
	end
end
