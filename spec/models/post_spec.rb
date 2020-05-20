require 'rails_helper'
require "pp"
RSpec.describe Post, type: :model do
  describe "test" do
    example "1" do
      pp Member.all();
    end
    example "2" do
      pp Member.select("*");
    end
    example "3" do
      pp Member.find_by_sql("select * from members");
    end
  end
end
