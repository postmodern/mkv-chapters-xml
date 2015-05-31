require 'mkv/chapters/xml/has_chapters'
require 'mkv/chapters/xml/timestamp'
require 'mkv/chapters/xml/chapter_display'

module MKV
  module Chapters
    class XML
      class ChapterAtom

        include HasChapters

        def initialize(node)
          @node = node
        end

        def uid
          if (chapter_uid = @node.at('ChapterUID'))
            chapter_uid.inner_text
          end
        end

        def time_start
          Timestamp.parse(@node.at('ChapterTimeStart').inner_text)
        end

        def time_end
          if (chapter_time_end = @node.at('ChapterTimeEnd'))
            Timestamp.parse(chapter_time_end.inner_text)
          end
        end

        def duration
          if time_end
            time_end - time_parse
          end
        end

        def display
          @display ||= ChapterDisplay.new(@node.at('ChapterDisplay'))
        end

        def hidden?
          flag_enabled?('Hidden')
        end

        def enabled?
          flag_enabled?('Enabled')
        end

        private

        def flag_enabled?(name)
          !@node.at("ChapterFlag#{name}[text() = '1']").nil?
        end

      end
    end
  end
end
