require 'spec_helper'

=begin

describe ApplicationHelper do 

	describe "full_title" do
		it "should include the page title" do
			expect(full_title("foo")).to match(/foo/)
		end

		it "should include the base title" do
			expect(full_title("foo")).not_to match(/\|/)
		end
	end
end

=end