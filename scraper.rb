#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/azerbaijan-national-assembly-wikipedia', column: 'wikiname')

cat_5 = WikiData::Category.new( 'Kateqoriya:Azərbaycan Respublikası Milli Məclisinin V çağırış deputatları', 'az').member_titles
cat_4 = WikiData::Category.new( 'Kateqoriya:Azərbaycan Respublikası Milli Məclisinin IV çağırış deputatları', 'az').member_titles


EveryPolitician::Wikidata.scrape_wikidata(names: { az: names | cat_4 | cat_5 }, output: false)

