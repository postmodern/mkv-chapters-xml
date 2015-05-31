module MKV
  module Chapters
    class XML
      module HasChapters
        def chapters
          return enum_for(__method__) unless block_given?

          @node.search('ChapterAtom').each do |chapter_atom|
            yield Chapter.new(chapter_atom)
          end
        end

        def [](chapter_uid)
          chapter_uid = chapter_uid.to_i

          if (chapter_atom = @node.at("//ChapterAtom[ChapterUID[text() = '#{chapter_uid}']]"))
            ChapterAtom.new(chapter_atom)
          end
        end
      end
    end
  end
end
