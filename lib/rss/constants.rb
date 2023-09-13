require "io/console/size"
module RSS
	Padding=6
	IO_R=IO.new(0)
	IO_W=IO.new(1)
	#WindowSize=IO_W.winsize[1].to_i
	WindowSize=70
end
