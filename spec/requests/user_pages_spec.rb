require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.full_name)  }
    it { should have_title(user.full_name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign Up') }
    it { should have_title(full_title('Sign Up')) }
  end

  describe "sign up" do
    
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "First name",            with: "Johnny"
        fill_in "Last name",             with: "Poo-Poo Pants"
        fill_in "Email",                 with: "jppp@itf.com"
        fill_in "Password",              with: "foofwoof"
        fill_in "Password confirmation", with: "foofwoof"
#        find(:css, "#user_newsletter[value='1']").set(true)
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'jppp@itf.com') }

        it { should have_link('Sign Out') }
        it { should have_title(user.full_name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
