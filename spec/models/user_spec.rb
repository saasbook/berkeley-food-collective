require 'rails_helper.rb'
RSpec.describe User do
  describe "Populate users from Airtable" do
    it "adds new user from Airtable to database" do
      User.populate_from_airtable
      user = User.find_by(email: "adi@example.com")
      expect(user).not_to eq nil
    end
  end
end
