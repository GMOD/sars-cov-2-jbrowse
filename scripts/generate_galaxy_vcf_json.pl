#!/usr/bin/perl
use strict;
use warnings;


while (<DATA>) {
    chomp;


    my ($id, $loc) = split /\t/;

    print
    qq{       {
         "category" : "Variants/$loc",
         "glyph" : "wormbase-glyphs/View/FeatureGlyph/Diamond",
         "key" : "$id",
         "label" : "$id",
         "maxHeight" : 3000,
         "metadata" : {
            "about" : "Variation from the reference sequence for <a href='https://www.ncbi.nlm.nih.gov/sra/$id'>$id</a> from $loc. Green variants have a frequency of 5% or more; yellow, less than 5%. For more information on the analysis that produced these data, see https://github.com/galaxyproject/SARS-CoV-2"
         },
         "storeClass" : "JBrowse/Store/SeqFeature/VCFTabix",
         "style" : {
            "height" : 8,
	    "color" : "function(f) {var af = f.get('AF'); af = af.values[0];  if (af < 0.05) {return 'gold';} return 'green';}"
         },
	 "onClick" : {
            "label" : "function(track,f) {var af = f.get('AF'); af = af.values[0]; var start = f.get('start');var eff = f.get('EFF');eff = eff.values[0];var neweff = eff.replace('(', '</br>(');return '<b>Location:</b> '+start+'</br><b>Frequency:</b> '+af+'</br><b>Predicted effect:</b></br>'+neweff;}",
            "url" : "",
            "title" : "Variant data",
            "action" : "defaultDialog"
         },
         "type" : "CanvasVariants",
         "unsafeMouseover" : true,
         "unsafePopup" : true,
         "urlTemplate" : "https://s3.amazonaws.com/gmod-genomes-of-interest/jbrowse/data/SARS-CoV-2/VCF/$id.vcf.gz"
      },
      }
       , "\n";
}







__DATA__
SRR10903401	Wuhan, China
SRR11059946	Wuhan, China
SRR11247075	Seattle, WA, USA
SRR11278166	Seattle, WA, USA
SRR11397718	Melbourne, Australia
SRR11410533	Salt Lake City, UT, USA
SRR10903402	Wuhan, China
SRR11059947	Wuhan, China
SRR11247076	Seattle, WA, USA
SRR11278167	Seattle, WA, USA
SRR11397719	Melbourne, Australia
SRR11410536	Salt Lake City, UT, USA
SRR10971381	Wuhan, China
SRR11140744	Madison, WI, USA
SRR11247077	Seattle, WA, USA
SRR11278168	Seattle, WA, USA
SRR11397720	Melbourne, Australia
SRR11410538	Salt Lake City, UT, USA
SRR11059940	Wuhan, China
SRR11140746	Madison, WI, USA
SRR11247078	Seattle, WA, USA
SRR11314339	Seattle, WA, USA
SRR11397728	Seattle, WA, USA
SRR11410540	Salt Lake City, UT, USA
SRR11059941	Wuhan, China
SRR11140748	Madison, WI, USA
SRR11278090	Seattle, WA, USA
SRR11393704	Unknown, USA
SRR11397729	Melbourne, Australia
SRR11410538	Salt Lake City, UT, USA
SRR11410541	Salt Lake City, UT, USA
SRR11059942	Salt Lake City, UT, USA
SRR11140750	Madison, WI, USA
SRR11278091	Seattle, WA, USA
SRR11397714	Seattle, WA, USA
SRR11409417	Unknown, USA
SRR11410542	Salt Lake City, UT, USA
SRR11059943	Wuhan, China
SRR11177792	Kathmandu, Nepal
SRR11278092	Seattle, WA, USA
SRR11397715	Melbourne, Australia
SRR11410528	Salt Lake City, UT, USA
SRR11059944	Wuhan, China
SRR11241254	Seattle, WA, USA
SRR11278164	Seattle, WA, USA
SRR11397716	Melbourne, Australia
SRR11410529	Salt Lake City, UT, USA
SRR11059945	Wuhan, China
SRR11241255	Wuhan, China
SRR11278165	Seattle, WA, USA
SRR11397717	Melbourne, Australia
SRR11410532	Salt Lake City, UT, USA
