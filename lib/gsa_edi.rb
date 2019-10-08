require "stupidedi"
# require "x12"

require "term/ansicolor"
require "pp"
require "colorize"
require 'awesome_print'

AwesomePrint.force_colors! true
AwesomePrint.defaults = { index: false, multiline: true, raw: true, ruby19_syntax: true }

puts"╔"<<"═"*85<<"╗".colorize(:cyan)
puts"\t832 Transaction (Ver/Rel 3050) Vendor Catalog data for GSA Advantage!".colorize(:magenta)
puts"╚"<<"═"*85<<"╝".colorize(:cyan)

TERMINATOR          = 0x1C
ELEMENT_SEPARATOR   = 0x1D
COMPONENT_SEPARATOR = 0x1F


require_relative "gsa_edi/832_v3050"
require_relative "gsa_edi/reader"
require_relative "gsa_edi/writer"

# read in xlsx files
# import into database
# SFTP
