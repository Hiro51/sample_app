require 'spec_helper'

describe "Static pages" do
	
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_content(heading) }
		it { should have_title(full_title(page_title))}
	end

	describe "Home page" do
		before { visit root_path }
		let(:heading) {'Sample App'}
		let(:page_title) {''}

		it_should_behave_like "all static pages"
		it { should_not have_content('| Home')}

		describe "for signed_in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
        		user.feed.each do |item|
          			expect(page).to have_selector("li##{item.id}", text: item.content)
        		end
      		end
 		end
	end

	describe "Help page" do
		before { visit help_path}
		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }

		it_should_behave_like "all static pages"
	end

	describe "Anout page" do
		before { visit about_path}
		let(:heading) { 'About' }
		let(:page_title) { 'About' }

		it_should_behave_like "all static pages"
	end
	describe "Contact Us page" do 
		before { visit contact_path}
		let(:heading) { 'Contact' }
		let(:page_title) { 'Contact' }

		it_should_behave_like "all static pages"
	end
end
