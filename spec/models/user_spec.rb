require 'rails_helper.rb'
RSpec.describe User do
  describe "Populate users from Airtable" do

    it "adds new user from Airtable to database" do
      User.populate_from_airtable
      user = User.find_by(email: "adi@example.com")
      expect(user).not_to eq nil
    end

    it "deactivates removed user" do
      User.populate_from_airtable
      user = User.find_by(email: "andrewmo@berkeley.edu")
      expect(user).not_to eq nil
      expect(user.active).to be_falsey
    end

  end
end
