require 'open-uri'
# require 'pry'

puts "Enter URL: "
url = gets.strip

# binding.pry
images = open(url).read.scan(/"(.*?)"/im)
    .map { |i| i[0].to_s }
    .select { |i| i=~/(.jpg|.png|.jpeg|.gif)/im }
    .reject {|i| ['.jpg', '.gif', '.png', '.jpeg'].include?(i) }
    .map do |img|
        img =~ /^http/i ? img : URI.join(url, img)
end

puts images
