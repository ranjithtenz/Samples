require 'rubygems'
require 'spidr'

puts "Enter the URL : " 
name = gets()
Spidr.site(name)do |spider|
  spider.every_page do |page|
    puts "[-] #{page.url}"

    page.search('//meta').each do |meta|
    name = (meta.attributes['name'] || meta.attributes['http-equiv'])
      value = meta.attributes['content']

      puts "    #{name} = #{value}"
    end
  end
end
