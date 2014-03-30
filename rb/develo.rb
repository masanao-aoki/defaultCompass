require "sass"

module Develo
    def isFile(fileName)
		path = fileName.value
		Sass::Script::String.new(FileTest.exist?(path).to_s)
    end

	def fileList(fileName)
		array = []
		dirs = Dir.glob(fileName.value)
		dirs.each_with_index do |li,i|
			if i == 0 || li.is_a?(Sass::Script::Color) then
				array.push(li)
			else
				array[i-1] = Sass::Script::String.new("#{array[i-1]}#{li}")
			end
		end
		Sass::Script::List.new(array,',')
	end
	
	def sqrt(x)
		numeric_transformation(x){|value| Math::sqrt(value)}
	end
end

module Sass::Script::Functions
    include Develo
end