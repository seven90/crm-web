class Rolodex
  attr_accessor :contacts
  def initialize
	@contacts = []
	@contact_id = 1000
  end

  def add_contact(contact)
	@contacts << contact
	contact.id = @contact_id
	@contact_id += 1
  end 

  def find_contact
	@contact_to_modify = 0
	puts "\e[H\e[2J"
	puts "Find Contact"
	puts ""
	print "What is the first name of the contact you want to modify?"
	first_check = gets.chomp.downcase
	@similar_names = @contacts.find_all {|name| name.first_name.downcase == first_check}
	@similar_names.map do |name| 
	  puts "#{name.first_name} #{name.last_name} , is this the name you want to modify? [1=Y] [2=N]"
	  answer = gets.chomp.to_i
		case answer
		when 1 then @contact_to_modify = name 
		  break
		when 2 then next
		else puts "Error"
		end 
	  end 
  end 

  def modify_contact 
	find_contact 
	if @contact_to_modify == 0 
	  puts "User not found"
	  modify_contact
	else    
	puts "What attribute would you like to modify?"
	puts " [1] First name"
	puts " [2] Last name"
	puts " [3] Email "
	puts " [4] Note"
	user_select = gets.chomp.to_i
	case user_select
	when 1 then puts "What would you like to change it to?"
	@contact_to_modify.first_name = gets.chomp
	puts "New first name is: #{@contact_to_modify.first_name}" 
	when 2 then puts "What would you like to change it to?"
	@contact_to_modify.last_name = gets.chomp
	puts "New last name is: #{@contact_to_modify.last_name}"
	when 3 then puts "What would you like to change it to?"
	@contact_to_modify.email = gets.chomp
	puts "New email is #{@contact_to_modify.email}"
	when 4 then puts "What would you like to change it to?"
	@contact_to_modify.note = gets.chomp
	puts "New note is #{@contact_to_modify.note}" 
	else 
	  find_contact
	end
	gets
	puts "\e[H\e[2J"
	end
  end     

  def delete_contact
	find_contact
	puts "Do you want to delete #{@contact_to_modify.first_name} #{@contact_to_modify.last_name}"
	user_select = gets.chomp.to_s.upcase
	case user_select 
	when "Y" then @contacts.delete(@contact_to_modify)
	when "N" then find_contact
	end
	puts "User #{@contact_to_modify.first_name} #{@contact_to_modify.last_name} was deleted!"
	gets
	puts "\e[H\e[2J" 
  end

  def display_an_attribute
	puts "What attributes do you want to display?"
	puts " [1] First names [2] Last names [3] Emails [4] Notes "
	user_choice = gets.chomp.to_i
	case user_choice 
	when 1 then @contacts.map { |x| puts "#{x.first_name}"  }
	when 2 then @contacts.map { |x| puts "#{x.last_name}"  }
	when 3 then @contacts.map { |x| puts "#{x.email}"  }
	when 4 then @contacts.map { |x| puts "#{x.note}"  } 
	end 
	gets
	puts "\e[H\e[2J"
  end
	

end 

