require "application_system_test_case"

class MoviesTest < application_system_test_case
  test "home page" do 
    visit movies_url
    assert_selector "h1", text: "List of all movies"
  end

end

