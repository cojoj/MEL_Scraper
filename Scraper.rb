require 'open-uri'
require 'nokogiri'
require 'json'

open('http://www.s-techent.com/ATA100.htm') do |f|

  doc = Nokogiri::HTML(f)
  table = doc.at_xpath('//table[count(tr) > 1]')

  chapters = []
  chapter = nil

  table.xpath('tr').each do |tr|

    td = tr.xpath('td')
    td = td.map { |td| td.content.gsub("\u00A0", ' ').strip }
    td = td.select { |txt| not txt.empty? }
    next if td.empty?

    if td[0] =~ /^\d+/

      chapters << chapter if chapter

      chapter = {
          'chapter'     => td[0],
          'title'       => td[1],
          'description' => td[2] || ''
      }

    elsif td[0] =~ /^-(\d+)/

      section = {
          'number'      => $1,
          'title'       => td[1] || '',
          'description' => td[2] || ''
      }

      chapter['section'] ||= []
      chapter['section'] << section
    end

  end

  chapters << chapter if chapter

  File.open('data.json', 'w+') do |f|
    f << JSON.pretty_generate(chapters)
  end

end