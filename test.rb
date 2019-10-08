require_relative 'lib/gsa_edi'


# Input: files from Import
puts "start"
# io = File.open("IO/EDI/afflink.edi")
# text = File.read("IO/EDI/afflink.edi")
# text = File.read("IO/EDI/non_printing.txt") #, mode: "rb"
text = File.binread("IO/EDI/non_printing.txt") #, mode: "rb"

# print text
 line = text.lines[0]
puts line
line = line.tr("\0x1D",'!')
puts line
# .to_s(16)
# puts line
#  hex_1d = 0x1D.to_s(10)
# line.gsub!(hex_1d,'*')
# puts line
# new_text = text.unpack("c*")
# text.gsub!('�','*')
# ic = Iconv.new('UTF-8', 'WINDOWS-1252')
# valid_string = ic.iconv(text + ' ')[0..-2]
# puts text
# new_contents = text.gsub(/search_regexp/, "replacement string")


 parse_832(text)
# Output: