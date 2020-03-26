#!/usr/bin/perl
use strict;
use warnings;


while (<DATA>) {
    chomp;


    print
    qq(       {
         "category" : "Variants",
         "glyph" : "wormbase-glyphs/View/FeatureGlyph/Diamond",
         "key" : "$_",
         "label" : "$_",
         "maxHeight" : 3000,
         "metadata" : {
            "about" : "Variation from the reference sequence for $_. For more information on the analysis that produced these data, see https://github.com/galaxyproject/SARS-CoV-2"
         },
         "storeClass" : "JBrowse/Store/SeqFeature/VCFTabix",
         "style" : {
            "height" : 8
         },
         "type" : "CanvasVariants",
         "unsafeMouseover" : true,
         "unsafePopup" : true,
         "urlTemplate" : "https://s3.amazonaws.com/gmod-genomes-of-interest/jbrowse/data/SARS-CoV-2/VCF/$_.vcf.gz"
      },)
       , "\n";
}







__DATA__
SRR10903401
SRR11059946
SRR11247075
SRR11278166
SRR11397718
SRR11410533
SRR10903402
SRR11059947
SRR11247076
SRR11278167
SRR11397719
SRR11410536
SRR10971381
SRR11140744
SRR11247077
SRR11278168
SRR11397720
SRR11410538
SRR11059940
SRR11140746
SRR11247078
SRR11314339
SRR11397728
SRR11410540
SRR11059941
SRR11140748
SRR11278090
SRR11393704
SRR11397729
SRR11410541
SRR11059942
SRR11140750
SRR11278091
SRR11397714
SRR11409417
SRR11410542
SRR11059943
SRR11177792
SRR11278092
SRR11397715
SRR11410528
SRR11059944
SRR11241254
SRR11278164
SRR11397716
SRR11410529
SRR11059945
SRR11241255
SRR11278165
SRR11397717
SRR11410532
