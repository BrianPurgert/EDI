# EDI

https://vsc.gsa.gov/sipuser/startup_kit.cfm
https://vsc.gsa.gov/faq/startup-kit.cfm#ediInstructions


### GSA SFTP (SSH) Information
🔑|🔓
---|---
Url|ecdata.fas.gsa.gov 

```
If pushing files just drop file in home directory
If pulling files then change directory(cd) to togo
```
## 832: Prices Sales Catalog

### GSA EDI Contacts
🔑|🔓
|:---|:---|
## Other Information
Name|Value
|:---|:---|
ISA GSA Trading Partner ID:| ZZ:GSAADV
GS GSA Trading Partner ID:|GSAADV
VAN:|Sterling/IBM


### EDI Files
samples use 
"*" element separators 
">" segment terminators. 
Federal Implementation Convention, Pt 10: 
hexadecimal 
1C=terminator, 
1D=element separator, 
1F=component separator [*]

```
99F9999Q.A*, 99F9999Q.R*, 99F9999Q.W*, 99F9999Q.C*, 99F9999Q.T* or 99F9999Q.V*
```
1. A80 Original File: Contains original information to be placed on Advantage!
1. C80 Change file: Changes made to existing file on GSA Advantage!
1. R80 Replacement file: Replacing entire catalog on Advantage!
1. W80 Text file: Text File document
1. P80A, B, C…etc Photo File: Contains all photos you have attached in SIP
1. T80 Temporary Price File: Any temporary prices start and stop dates.

07F177GA.P8A = archive 

[:segment,
 :ISA,
 [:simple, "00"],
 [:simple, "          "],
 [:simple, "00"],
 [:simple, "          "],
 [:simple, "01"],
 [:simple, "099103111      "],
 [:simple, "01"],
 [:simple, "012966339SIP   "],
 [:simple, "190226"],
 [:simple, "1034"],
 [:simple, "U"],
 [:simple, "03050"],
 [:simple, "905738082"],
 [:simple, "0"],
 [:simple, "T"],
 [:simple, "G"]]

## Special Instructions
Any unique eight-bit (byte) character could serve as data element separator, segment terminator, or subelement separator, provided
each character is disjoint from all data elements within an interchange and that these do not conflict with telecommunications
protocols necessary to the transmission of the interchange. The
following recommended values conform with information published in Electronic Data Interchange, X12 Standards, Version 3, Release 5, Interchange Control Structures, Section 4.3 Delimiter
Specifications.
### Data Element Separator
While the data element separator is graphically displayed as an
asterisk (*) in ASC X12 documentation, it is the value employed
in the fourth byte of an interchange envelope that actually assigns
the separator that the translators will use throughout an interchange.ASC X12 recommends the ASCII character with hexadecimal value
"1D" for use as the data element separator (gs).
data_element_separator = "\x1D"
### Segment Terminator
 ASC X12 documentation usually portrays this as a new line (n/l) character,
occurring immediately following the ISA16 segment.
ASC X12 recommends the ASCII character with hexadecimal value
"1C" for use as the segment (fs) terminator.
segment_terminator = "\x1C"
### Subelement Separator
(ISA16) for defining the subelement separator within an interchange. Although designated as reserved for future expansion in Version 3, Release 5, a
value in ISA16 is required.
ASC X12 recommends the ASCII character with hexadecimal value
"1F" for use as the subelement separation (us) character.
subelement_separator = "\x1F"
