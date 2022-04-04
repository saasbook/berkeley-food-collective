class UserController < ApplicationController
  def airtable_update
    User.populate_from_airtable
  end
end
