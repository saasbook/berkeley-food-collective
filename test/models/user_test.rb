require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get airtable record" do
    User.populate_from_airtable
    assert User.find_by(email: "adi@example.com") != nil
    #assert User.find_by(email: "andrewmo@berkeley.edu") == nil #depends on whether db is wiped or not on populate call
  end

end
