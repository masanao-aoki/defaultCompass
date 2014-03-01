require "sass"

module Develo
    def isFile(fileName)
		path = fileName.value
		Sass::Script::String.new(FileTest.exist?(path).to_s)
    end
end

module Sass::Script::Functions
    include Develo
end