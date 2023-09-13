module RSS
	class Line
		attr_reader :length, :tokenz
		def initialize(_content, _padding=false)
			@content = _content
			@length  = @content.length
			@padding = _padding
			@tokenz = []
			_tokenize()
		end

		def render
			return "#{" " * Padding if @padding}-#{@content}"
		end

		private
		def _tokenize
			p = @padding ? Padding : 0
			return @tokenz = [@content] unless @content.length > WindowSize - p
			i = 0
			while(i <= @content.length - WindowSize)
				spaceIndex = @content[i, WindowSize-p].rindex(" ")
				chunk = @content[i, spaceIndex+1]
				@tokenz << chunk
				i += chunk.size
			end
			@tokenz << @content.slice(i, @content.size)
		end
	end
end
