#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/azerbaijan-national-assembly-wikipedia', column: 'wikiname')
EveryPolitician::Wikidata.scrape_wikidata(names: { az: names }, output: false)

