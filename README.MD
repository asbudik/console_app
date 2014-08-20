<!-- To Start

Create a model called Student, that has a first_name, last_name and age
Don't forget to run your migrations
Tasks to create

Using the new/save syntax, create a student, first and last name and an age -->

`rails generate model Student first_name:string last_name:string age:integer
rake db:migrate`

<!-- Save the student to the database
 -->
`me = Student.new
me.save`

<!--  Using the find/set/save syntax update the student's first name to taco
 -->
`me = Student.find(1)
me.first_name = "Adam"
me.save`

<!--  Delete the student (where first_name is taco)
 -->

`Student.find_by_first_name("taco").destroy`

<!--  Validate that every Student's last name is unique
 -->

`validates_uniqueness_of :last_name`

<!--  Validate that every Student has a first and last name that is longer than 4 characters
 -->

 `validates_length_of :first_name, {:minimum => 5}
 validates_length_of :last_name, {:minimum => 5}`

<!--  Validate that every first and last name cannot be empty
 -->
  `validates_presence_of :first_name
  validates_presence_of :last_name`

<!--  Combine all of these individual validations into one validation (using validate and a hash)
 -->

 `validates :first_name, :presence => true, :length => {:minimum => 5}, :uniqueness => true
 validates :last_name, :presence => true, :length => {:minimum => 5}, :uniqueness => true`

<!--  Using the create syntax create a student named John Doe who is 33 years old
 -->

`student = Student.new(:first_name => "John", :last_name => "Doe", :age => 33)`

<!--  Show if this new student entry is valid
 -->

`student.valid?`

<!--  Show the number of errors for this student instance
 -->

`student.errors.size`

<!--  In one command, Change John Doe's name to Jonathan Doesmith
 -->

`student.update_attributes(:first_name => "Jonathan", :last_name => "Doesmith")`

<!--  Clear the errors array
 -->

`student.errors`

<!--  Save Jonathan Doesmith
 -->

`student.save`

<!--  Find all of the Students
 -->

`Student.all`

<!--  Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error
 -->

`Student.find_by_id(128)`

<!--  Find the first student in the table
 -->

`Student.first`

<!--  Find the last student in the table
 -->

 `Student.last`

<!--  Find the student with the last name of Doesmith
 -->

`Student.find_by_last_name("Doesmith")`

<!--  Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order
 -->

Student.all.limit(5).offset(1).order(first_name: :asc)

<!--  Delete Jonathan Doesmith
 -->

'Student.where(first_name: "Jonathan", last_name: "Doesmith").destroy_all'

<!--  Bonus

Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter
 -->

`validates_format_of :first_name, :with => /^[A-Z][a-zA-Z]+/, :on => :create
validates_format_of :last_name, :with => /^[A-Z][a-zA-Z]+/, :on => :create`

<!-- Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table -->

`FORBIDDEN_FIRSTNAMES = [["Delmer", "Reed"], ["Elie", "Schoppik"], ["Anil", "Bridgpal"], ["Tim", "Licata"]]
  validate :username_is_allowed

  def username_is_allowed
    if FORBIDDEN_FIRSTNAMES.include?([first_name, last_name])
      errors.add(:first_name, "#{first_name} is a restricted username")
    end
  end`

