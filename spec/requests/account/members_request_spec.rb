require 'rails_helper'
require "pp"
RSpec.describe "Account::Members", type: :request do
    describe "test" do
        example "1" do
         pp Member.find_by(id:1)

        end
    end


end
