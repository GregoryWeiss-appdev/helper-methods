require "application_system_test_case"

class DirectorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit directors_url
    assert_selector "h1", text: "List of all directors"
  end

  test "creating a Director" do
    original_director_count = Director.count

    visit directors_url
    click_on "Add a new director"

    fill_in "Name", with: "Director's Name"
    fill_in "Dob", :with => "2021-04-15"
    choose "director_sex_male"

    click_on "Create Director"

    assert_text "Director added successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count + 1, ending_director_count
  end

  test "updating a Director" do
    @director = directors(:one)

    visit "/directors/#{@director.id}/edit"

    fill_in "director_name", with: "Director's Name"
    fill_in "Dob", :with => "2021-04-15"
    choose "director_sex_female"

    click_on "Update Director"
    
    assert_text "Director updated successfully"

    @director.reload
    assert_equal "Director's Name", @director.name
    assert_equal "2021-04-15".to_date, @director.dob
    assert_equal "Female", @director.sex
  end

  test "destroying a Director" do
    @director = directors(:one)
    original_director_count = Director.count

    visit directors_url
    click_on "Show details", match: :first
    click_on "remove director"

    assert_text "Director deleted successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count - 1, ending_director_count
  end
end
