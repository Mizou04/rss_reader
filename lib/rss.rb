lib_loc = File.expand_path(File.join(__dir__))
$:.unshift(lib_loc) unless $:.include?(lib_loc)

require "rss"

module RSS
end

require "rss/line"
require "rss/constants"

