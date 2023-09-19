module RSS
	class Line
		attr_reader :length, :padding
		def initialize(_content, _padding=false)
			@content = _content
			@length  = @content.length
			@padding = _padding
			@tokenz = []
		end

		def render
			_tokenize()
			return @tokenz
		end

		private
		def _tokenize
			p = @padding ? Padding + DefPad : DefPad
			if @content.length < $WindowSize - p
				@tokenz = ["#{" " * p}#{@content}"]
				return @tokenz
			end
			i = 0
			while(i <= @content.length - $WindowSize)
				spaceIndex = @content[i, $WindowSize-p].rindex(" ")
				chunk = @content[i, spaceIndex+1]
				@tokenz << "#{" " * p}#{chunk}"
				i += chunk.size
			end
			@tokenz << "#{" " * p}#{@content.slice(i, @content.size)}"
		end
	end
end
