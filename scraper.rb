#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/azerbaijan-national-assembly-wikipedia', column: 'wikiname')

cat_5 = WikiData::Category.new( 'Kateqoriya:Azərbaycan Respublikası Milli Məclisinin V çağırış deputatları', 'az').member_titles
cat_4 = WikiData::Category.new( 'Kateqoriya:Azərbaycan Respublikası Milli Məclisinin IV çağırış deputatları', 'az').member_titles

# Members of the 4th/5th Convocation
sparq = <<EOQ
  SELECT DISTINCT ?item WHERE {
    VALUES ?term { wd:Q50595190 wd:Q28527720 }
    ?item p:P39 [ ps:P39 wd:Q21269547 ; pq:P2937 ?term ]
  }
EOQ
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { az: names | cat_4 | cat_5 })

