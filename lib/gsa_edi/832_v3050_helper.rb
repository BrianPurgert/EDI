require 'date'
require 'awesome_print'
AwesomePrint.force_colors! true
AwesomePrint.defaults = { index: false, multiline: true, raw: true, ruby19_syntax: true }

GSA_DUNS    = "012966339"

def 🔟(str = '')
	str.ljust(10)
end

def 📅
	DateTime.now.strftime("%y%m%d")
end

def 🕛
	DateTime.now.strftime("%H%M")
end

puts 📅
puts 🕛