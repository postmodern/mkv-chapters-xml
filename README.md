# mkv-chapters-xml

* [Homepage](https://github.com/postmodern/mkv-chapters-xml#readme)
* [Issues](https://github.com/postmodern/mkv-chapters-xml/issues)
* [Documentation](http://rubydoc.info/gems/mkv-chapters-xml/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

Ruby classes for querying and modifying [Matroska (MKV)][mkv] chapters XML.

## Features

* Supports parsing mkv `chapters.xml` files.
* Supports extracting/parsing chapters using [mkvextract].
* Supports parsing nested chapters and multiple editions.

## Examples

    require 'mkv/chapters/xml'

    xml = MKV::Chapters::XML.extract('video.mkv')

## Requirements

* [nokogiri] ~> 1.0

## Install

    $ gem install mkv-chapters-xml

## TODO

* Support building/manipulating chapters XML.
* Support parsing the following nodes:
  * `ChapterSegmentUID`
  * `ChapterSegmentEditionUID`
  * `ChapterPhysicalEquiv`
  * `ChapterTrack`
  * `ChapterProcess`
    * `ChapterProcessCodecID`
    * `ChapterProcessPrivate`
    * `ChapterProcessCommand`
      * `ChapterProcessTime`
      * `ChapterProcessData`

## Copyright

Copyright (c) 2015 Postmodern

See {file:LICENSE.txt} for details.

[mkv]: http://www.matroska.org/
[mkvextract]: https://www.bunkus.org/videotools/mkvtoolnix/doc/mkvextract.html
[nokogiri]: http://www.nokogiri.org/
