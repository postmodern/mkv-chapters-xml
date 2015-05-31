require 'mkv/chapters/xml/version'

require 'nokogiri'
require 'shellwords'

module MKV
  module Chapters
    class XML

      def initialize(doc)
        @doc = doc
      end

      def self.parse(string)
        new(Nokogiri::XML.parse(string))
      end

      def self.open(path)
        new(Nokogiri::XML(File.open(path)))
      end

      def self.extract(path)
        parse(`mkvextract chapters #{Shellwords.shellescape(path)}`)
      end

      def each_edition_entry
        return enum_for(__methods__) unless block_given?

        @doc.search('/Chapters/EditionEntry').each do |edition_entry|
          yield EditionEntry.new(edition_entry)
        end
      end

      def edition_entries
        each_edition_entry
      end

      def [](edition_uid)
        edition_uid = edition_uid.to_i

        if (edition_entry = @node.at("/Chapters/EditionEntry[EditionUID[text() = '#{edition_uid}']]"))
          EditionEntry.new(edition_entry)
        end
      end

    end
  end
end
