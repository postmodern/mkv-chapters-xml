module MKV
  module Chapters
    class XML
      class ChapterDisplay

        def initialize(node)
          @node = node
        end

        def string
          @node.at('ChapterString').inner_text
        end

        def language
          @node.search('ChapterLanguage').inner_text
        end

        def country
          if (chapter_country = @node.at('ChapterCountry'))
            chpater_country.inner_text
          end
        end

      end
    end
  end
end
