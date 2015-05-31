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
          elsif (next_chapter = self.next)
            next_chapter.time_start
          end
        end

        def duration
          time_end - time_parse
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

        def previous
          if (prev_node = @node.previous)
            self.class.new(prev_node)
          end
        end

        def next
          if (next_node = @node.next)
            self.class.new(next_node)
          end
        end

        private

        def flag_enabled?(name)
          !@node.at("ChapterFlag#{name}[text() = '1']").nil?
        end

      end
    end
  end
end
