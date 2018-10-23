class User

  attr_accessor :dbase

  def initialize
    @dbase = []
  end

  def create(params)
    params[:id] = dbase.any? ? dbase.last[:id].next : 1
    return "You must fill all the fields" if is_invalid?(params)
    return "EMAIL NOT AVAILABLE" if user_exist?(params[:email])
    dbase << params
  end

  def count
    dbase.count
  end

  def update(id, params)
    return "Error, could not update" unless find_by(id) unless is_a_key?(params).empty?
    return "Complete the fields" if is_invalid?(params)
    dbase.each do |user|
      if user[:id].eql?(id)
        params.keys.each { |key| user[key] = params[key] }
      end
    end
  end

  def find(id)
    user = find_by(id)
    return user if user
    "The user with that ID was not found"
  end

  def all
    dbase
  end

  def where (value)
    user = dbase.select { |search| search[:first_name].eql?(value) || search[:last_name].eql?(value) ||search[:age].eql?(value) }
    user.any? ? user : "No matches found"
  end

  def destroy(id)
    return "It was not found" unless find_by(id)
    dbase.delete_if {|record| record[:id].eql?(id)}
  end

  private

  def is_invalid?(params)
    params[:first_name].empty? || params[:last_name].empty? || params[:email].empty?
  end

  def user_exist?(email)
    dbase.select {|user| user[:email].eql?(email)}.any?
  end

  def find_by(id)
    dbase.select { |user| user[:id].eql?(id) }[0]
  end

  def is_a_key?(params)
    params.keys.select { |key| key.eql?(:first_name) || key.eql?(:last_name) || key.eql?(:email) }
  end

end

#---------------TEST------------------
require 'minitest/autorun'

describe User do

  before do
    @dbase = User.new
    @dbase.create({first_name: "Juan", last_name: "Cueto", email: "nsr.nsr1@gmail.com",
    age: 29, address: "cra 98"})
  end

  describe "#Create" do
    describe  "when a user is created" do
      it "It must be saved successfully" do
        @dbase.create({first_name: "Juan", last_name: "Cueto", email: "nsr.nsr@gmail.com",
        age: 29, address: "cra 98"}).must_equal([{:first_name=>"Juan", :last_name=>"Cueto", :email=>"nsr.nsr1@gmail.com", :age=>29, :address=>"cra 98", :id=>1}, {:first_name=>"Juan", :last_name=>"Cueto", :email=>"nsr.nsr@gmail.com", :age=>29, :address=>"cra 98", :id=>2}])
      end
    end

    describe "When a user is going to be created and the required fields are not complete" do
      it "It must not allow it to be created without first name " do
        @dbase.create({first_name: "", last_name: "Alzate", email: "nsr.nsr1@gmail.com",
        age: 30, address: "cra 98"}).must_equal("You must fill all the fields")
      end

      it "It must not allow it to be created without last name " do
        @dbase.create({first_name: "Juan ", last_name: "", email: "nsr.nsr1@gmail.com",
        age: 30, address: "cra 98"}).must_equal("You must fill all the fields")
      end

      it "It must not allow it to be created without email " do
        @dbase.create({first_name: "Juan", last_name: "Alzate", email: "",
        age: 30, address: "cra 98"}).must_equal("You must fill all the fields")
      end
    end

    describe "When enter an email that is alredy in use" do
      it " It must not allow it to be created" do
        @dbase.create({first_name: "Juan", last_name: "Cueto", email: "nsr.nsr1@gmail.com",
        age: 29, address: "cra 98"}).must_equal("EMAIL NOT AVAILABLE")
      end
    end
  end

  describe "#Count" do
    describe "When want to know how many records there are" do
      it "It must obtains the number of users" do
        @dbase.count.must_equal(1)
      end
    end
  end

  describe "#Update" do
    describe "When a user is updated correctly" do
      it "It must be updated successfully" do
        @dbase.update(1 , {first_name:"Ryan",last_name: "Gosling", email: "ryan.gosling@gmail.com", age: 32, address:"cra 100"}).must_equal([{first_name:"Ryan", last_name:"Gosling", email:"ryan.gosling@gmail.com", age:32, address:"cra 100", id:1}])
      end
    end

    describe "When a user is going to be updated and the required fields are not complete" do
      it "It must not allow it to be updated without first name" do
        @dbase.update(1 ,{first_name:"", last_name:"Gosling", email: "ryan.gosling@gmail.com", age: 32, address:"cra 100"}).must_equal("Complete the fields")
      end

      it "It must not allow it to be updated without last name" do
        @dbase.update(1 ,{ first_name:"Ryan", last_name: "",email: "ryan.gosling@gmail.com", age: 32, address: "cra 100"}).must_equal("Complete the fields")
      end

      it "It must not allow it to be updated without email" do
        @dbase.update(1 , {first_name:"Ryan", last_name: "Gosling",email: "", age: 32, address:"cra 100"}).must_equal("Complete the fields")
      end
    end

    describe "When a user is going to be updated with an ID that doesn't exist" do
      it "It must show a error message " do
        @dbase.update( 20, {first_name:"Ryan", last_name:"Gosling", email:"ryan.gosling@gmail.com", age:32, address:"cra 100"}).must_equal("Error, could not update")
      end
    end
  end

  describe "#Find" do
    describe "When searching  for a user by ID" do
      it "It must show the user's data with that ID " do
        @dbase.find(1).must_equal({first_name: "Juan", last_name: "Cueto", email: "nsr.nsr1@gmail.com", age: 29, address: "cra 98", id: 1})
      end
    end

    describe "When searching for user with a ¡nvalid ID" do
      it "It must show a error message " do
        @dbase.find(10).must_equal("The user with that ID was not found")
      end
    end
  end

  describe "#All" do
    describe "When want to see all the users" do
      it "It must be display al the records" do
        @dbase.all.must_equal([{:first_name=>"Juan", :last_name=>"Cueto", :email=>"nsr.nsr1@gmail.com", :age=>29, :address=>"cra 98", :id=>1}])
      end
    end
  end

  describe "#Where" do
    describe "When want to filter by first name, last name or age." do
      it "It must display the coincidences found with the first name" do
        @dbase.where("Juan").must_equal([{:first_name=>"Juan", :last_name=>"Cueto", :email=>"nsr.nsr1@gmail.com", :age=>29, :address=>"cra 98", :id=>1}])
      end

      it "It must display the coincidences found with the last name" do
        @dbase.where("Cueto").must_equal([{:first_name=>"Juan", :last_name=>"Cueto", :email=>"nsr.nsr1@gmail.com", :age=>29, :address=>"cra 98", :id=>1}])
      end

      it "It must display the coincidences found with the age" do
        @dbase.where(29).must_equal([{:first_name=>"Juan", :last_name=>"Cueto", :email=>"nsr.nsr1@gmail.com", :age=>29, :address=>"cra 98", :id=>1}])
      end
    end

    describe "When want to filter by name, last name or age and don't find matches" do
      it "It must show that there are no matches" do
        @dbase.where("Mateo").must_equal("No matches found")
      end
    end
  end

  describe "#Destroy" do
    describe "When a record is deleted successfully" do
      it "It must delete the user" do
        @dbase.destroy(1).must_equal([])
      end
    end

    describe "When want to delete a record that doesn't exist" do
      it "it must display a error message" do
        @dbase.destroy(10).must_equal("It was not found")
      end
    end
  end

end

