module MKV
  module Chapters
    class XML
      class Timestamp

        def initialize(miliseconds)
          @miliseconds = miliseconds
        end

        def self.parse(time)
          hours = minutes = seconds = miliseconds = 0

          time, miliseconds = time.split('.',2)
          miliseconds = miliseconds ? miliseconds.to_i : 0

          seconds, minutes, hours = time.split(':',3).reverse.map(&:to_i)

          return new(
            (hours * 3600000) +
            (minutes * 60000) +
            (seconds * 1000)  +
            miliseconds
          )
        end

        def hours
          @miliseconds / 3_600_000
        end

        def minutes
          @miliseconds % 3_600_000 / 60_000
        end

        def seconds
          @miliseconds % 3_600_000 % 60_000 / 1_000
        end

        def miliseconds
          @miliseconds % 3_600_000 % 60_000 % 1_000
        end

        def +(duration)
          self.class.new(@miliseconds + duration.to_i)
        end

        def -(duration)
          self.class.new(@miliseconds - duration.to_i)
        end

        def <=>(duration)
          @miliseconds <=> duration.to_i
        end

        def to_i
          @miliseconds
        end

        def to_s
          sign = '-' if @miliseconds < 0

          "#{sign}%.2d:%.2d:%.2d.%.3d" % [hours, minutes, seconds, miliseconds]
        end

      end
    end
  end
end
