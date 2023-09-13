require "rss"

RSpec.describe(RSS::Line, "#length") do
	before(:all) do
		@smallContent = "1234567890"
		@largeContent = "Automata theory is the study of abstract machines and automata, as well as the computational problems that can be solved using them. It is a theory in theoretical computer science with close connections to mathematical logic. The word automata comes from the Greek word αὐτόματος, which means \"self-acting, self-willed, self-moving\""
	end
	context("line inner structure", :structure)
	it "given empty line it prints 0 as length" do
		line = RSS::Line.new("")
		expect(line.length).to be(0)
	end
	it "given line it prints 10 as length" do
		line = RSS::Line.new(@smallContent)
		expect(line.length).to be(10)
	end
	it "renders line" do
	line = RSS::Line.new(@smallContent)
	expect(line.render).to eq("-1234567890")
	end
	it "given padding=true it prints string with left padding #{RSS::Padding}" do
	line = RSS::Line.new(@smallContent, true)
	expect(line.render).to eq("#{" " * RSS::Padding}-1234567890")
	end

	it "given smaller content than window size (#{RSS::WindowSize}) with no padding, split to chunks" do
		line = RSS::Line.new(@smallContent)
		expect(line.tokenz.length).to eq(1 + @smallContent.size / RSS::WindowSize)
		expect(line.tokenz[0]).to eq(@smallContent)
	end

	it "given larger content than window size (#{RSS::WindowSize}) with no padding, split to chunks" do
		line = RSS::Line.new(@largeContent)
		expect(line.tokenz.length).to eq(1 + @largeContent.size / RSS::WindowSize)
	end
end
