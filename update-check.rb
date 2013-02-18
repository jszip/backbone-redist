#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

current = Gem::Version.new((Nokogiri::HTML(open('http://backbonejs.org/')).css('span[class="version"]').first.content().match /\((.*)\)/).captures[0])

maven = Gem::Version.new(Nokogiri::XML(File.open("pom.xml")).remove_namespaces!.xpath("/project/version").first.content().sub /-SNAPSHOT/,"")

if current >= maven
puts "A release can be made"
exit 1 
end
puts "Everything up to date"