require 'mkv/chapters/xml/has_chapters'

module MKV
  module Chapters
    class XML
      class Edition

        include HasChapters

        def initialize(node)
          @node = node
        end

        def uid
          if (edition_uid = @node.at('EditionUID'))
            edition_uid.inner_text
          end
        end

        def default?
          flag_enabled?('Default')
        end

        def hidden?
          flag_enabled?('Hidden')
        end

        def ordered?
          flag_enabled?('Ordered')
        end

        #
        # Total duration of the edition.
        #
        # @return [Integer]
        #   Total duration in seconds.
        #
        def duration
          total = 0

          if ordered?
            chapters.each { |chapter| total += chapter.duration }
          else
            chapters.each_cons(2) do |prev,next|
              total += next.time_start - prev.time_start
            end
          end

          return total
        end

        private

        def flag_enabled?(name)
          !@node.at("EditionFlag#{name}[text() = '1']").nil?
        end

      end
    end
  end
end
