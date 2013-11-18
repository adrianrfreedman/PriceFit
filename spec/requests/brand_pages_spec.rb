require 'spec_helper'

describe "Brand pages" do

  subject { page }

  describe "index page" do
    before { visit brands_path }

    it { should have_basic_page_content('Brands List') }

    describe "pagination" do
      before(:all) { 31.times { FactoryGirl.create(:brand) } }
      after(:all)  { Brand.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each brand" do
        Brand.paginate(page: 1).each do |brand|
          expect(page).to have_selector('li', text: brand.name)
        end
      end
    end
  end

  describe "brand page" do
    let(:brand) { FactoryGirl.create(:brand) }
    let!(:s1) { FactoryGirl.create(:dress_size) }
    let!(:s2) { FactoryGirl.create(:dress_size) }

    before { visit brand_path(brand) }

    it { should have_basic_page_content(brand.name) }

    describe "dress sizes" do
      it { should have_content(s1.legend) }
      it { should have_content(s2.legend) }
    end
  end
end
