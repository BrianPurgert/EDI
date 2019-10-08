require_relative 'lib/gsa_edi'
using Stupidedi::Refinements

file_path = "IO/EDI/non_printing.txt"

config = Stupidedi::Config.contrib
reader = Stupidedi::Reader.build(File.binread(file_path))


while (result = reader.read_segment).defined?
  segment_tok = result.fetch
  reader      = result.remainder

  pp segment_tok

  case segment_tok.id
	  when :GS
	    reader = result.remainder

	    # GS08: Version / Release / Industry Identifier Code
	    version = segment_tok.element_toks.at(7).try(:value)
	    gscode  = version.try(:slice, 0, 6)

	    # GS01: Functional Identifier Code
	    fgcode = segment_tok.element_toks.at(0).try(:value)

	    if config.functional_group.defined_at?(gscode)
	      envelope_def = config.functional_group.at(gscode)
	      envelope_val = envelope_def.empty
	      segment_dict = reader.segment_dict.push(envelope_val.segment_dict)
	      reader       = reader.copy(segment_dict: segment_dict)
	    end
	  when :GE
	    reader = reader.copy(segment_dict: reader.segment_dict.pop)
  end
end
