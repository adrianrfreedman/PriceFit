require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    
    describe "as a non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        visit users_path
      end
      
      describe "should be redirected to the home page" do
        it { should have_title('PriceFit') }
        it { should have_selector('h1', text: 'PriceFit') }
      end
    end

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit users_path
      end

      it { should have_title('All Users') }
      it { should have_selector('h1', text: 'All Users') }

      describe "pagination" do
        before(:all) { 30.times { FactoryGirl.create(:user) } }
        after(:all)  { User.delete_all }

        it { should have_selector('div.pagination') }

        it "should list each user" do
          User.all.order(:last_name).paginate(page: 1).each do |u|
            expect(page).to have_selector('li', text: u.full_name)
          end
        end
      end

      describe "delete links" do
        before do
          sign_in admin
          visit users_path
        end
      
        it { should have_link('delete') }#, href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('delete', match: :first)
          end.to change(User, :count).by(-1)
        end

        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit user_path(user)
    end

    it { should have_content(user.full_name)  }
    it { should have_title(user.full_name) }

#    it "users can delete their own accounts" do
#      expect do
#        click_link('here')
#      end.to change(User, :count).by(-1)
#    end
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

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit User") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_first_name) { "New" }
      let(:new_last_name)  { "Name" }
      let(:new_email)      { "new@itf.com" }
      before do
        fill_in "First name",         with: new_first_name
        fill_in "Last name",          with: new_last_name
        fill_in "Email",              with: new_email
        fill_in "Password",           with: user.password
        fill_in "Confirm Password",   with: user.password
        find(:css, "#user_newsletter[value='1']").set(false)
        click_button "Save changes"
      end

      it { should have_title("#{new_first_name} #{new_last_name}") }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign Out', href: signout_path) }
      specify { expect(user.reload.first_name).to eq new_first_name }
      specify { expect(user.reload.last_name).to  eq new_last_name }
      specify { expect(user.reload.email).to      eq new_email }
      specify { expect(user.reload.newsletter).to eq false }
    end
  end
end
