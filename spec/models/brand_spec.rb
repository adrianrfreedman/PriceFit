require 'spec_helper'

describe Brand do

  before { @brand = FactoryGirl.create(:brand) }

  subject { @brand }
  
  it { should respond_to(:name) }
  it { should respond_to(:website) }
  it { should respond_to(:country) }
  it { should respond_to(:brand_sizes) }

  describe "when name is not present" do
    before { @brand.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @brand.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when website is too long" do
    before { @brand.website = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when country is too long" do
    before { @brand.country = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      brand_with_same_name = @brand.dup
      brand_with_same_name.name = @brand.name.upcase
      brand_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "brand size associations" do
    before { @brand.save }
    let!(:brand_size) { FactoryGirl.create(:brand_size, brand: @brand) }

    it "should destroy associated brand sizes" do
      brand_sizes = @brand.brand_sizes.to_a
      @brand.destroy
      expect(brand_sizes).not_to be_empty
      brand_sizes.each do |bs|
        expect(BrandSize.where(id: brand_size.id)).to be_empty
      end
    end
  end
end
