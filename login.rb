require 'json'

puts "Welcome to Book Store"

file = File.read('/home/typing/intern/firstask/task1/file.json')
data_hash = JSON.parse(file)

#detail data wak check
datausername = data_hash["Username"]
datapassword = data_hash["Password"]
$user = data_hash["Full Name"]

#user input username
print "Enter your username : "
username = gets.chomp

if username == datausername
    puts " "
else 
    abort "Username Error"
end

#user input password
print "Enter your password : "
password = gets.chomp

if password == datapassword
    puts "Sucessfully Login!"
else 
    abort "Password Error"
end



# start looping add book
print "Add Book now ? (Y/N) : "
$addmorebook = gets.chomp
if $addmorebook == "Y"
 begin 
  #add book
  puts "Please enter tittle of your book : "
  $bookname = gets.chomp
  puts "Author name : "
  $bookauthor = gets.chomp

  #validate data sebelum masuk dale json
  print "Book Name     : " + $bookname
  print "\nBook Author's : " + $bookauthor

  print "\nThis book infomations is correct ? (Y/N)"
  validatebook = gets.chomp

  #sipe buku details dalam json file
  def sipebuku
      databuku = {
      "Book Name" => $bookname,
      "Book Author" => $bookauthor,
      "User" => $user,
    
      }
      File.open("/home/typing/intern/firstask/task1/databuku.json","w") do |f|
      f.write(JSON.pretty_generate(databuku))
      end
  end

  if validatebook == "Y"
      puts sipebuku
      puts "Successfully store your book"
  elsif validatebook == "N" 
      abort "Please login again ^-^!!"
  else
      print "Y or N only"
  end
  puts " "
  puts "Add more book ? : (Y/N)"
  $addmorebook = gets.chomp
 end while $addmorebook == "Y"

end

#view buku wat sipe doh
print "View Book ? (Y/N) : "
$viewmorebook = gets.chomp
if $viewmorebook == "Y"
 begin
    file = File.read('/home/typing/intern/firstask/task1/databuku.json')
    data_hash = JSON.parse(file)

    #detail data wak check
    namobuku = data_hash["Book Name"]
    orebuatbuku = data_hash["Book Author"]

    puts "Tittle of the book : " + namobuku
    puts "Author of the book : " + orebuatbuku
 end while $viewmorebook == "N"
end

print "Logout ? (Y/N) : "
$logout = gets.chomp
if $logout == "Y"
 begin
  if $logout += "Y"
      abort "Good Bye... See u Again..."
  end
 end while $logout == "N"
end
abort "Dah habis dah sambung esok pulak...."