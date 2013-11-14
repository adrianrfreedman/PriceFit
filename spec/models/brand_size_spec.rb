require 'spec_helper'

describe BrandSize do
  
  let(:brand) { FactoryGirl.create(:brand) }
  before { @size = brand.brand_sizes.build(size: 4, bust: 78, waist: 78,
                                           hip: 78, legend: "XXL or 18") }

  subject { @size }

  it { should respond_to(:size) }
  it { should respond_to(:bust) }
  it { should respond_to(:waist) }
  it { should respond_to(:hip) }
  it { should respond_to(:brand_id) }
  it { should respond_to(:legend) }
  its(:brand) { should eq brand }

  it { should be_valid }

  describe "when size is not present" do
    before { @size.size = nil }
    it { should_not be_valid }
  end

  describe "when bust is not present" do
    before { @size.bust = nil }
    it { should_not be_valid }
  end

  describe "when waist is not present" do
    before { @size.waist = nil }
    it { should_not be_valid }
  end

  describe "when hip is not present" do
    before { @size.hip = nil }
    it { should_not be_valid }
  end

  describe "when brand_id is not present" do
    before { @size.brand_id = nil }
    it { should_not be_valid }
  end

  describe "when legend is not present" do
    before { @size.legend = nil }
    it { should_not be_valid }
  end

  describe "when size is out of range" do
    before { @size.size = 3 }
    it { should_not be_valid }
  end

  describe "when bust" do
    describe "is too small" do
      before { @size.bust = 50 }
      it { should_not be_valid }
    end

    describe "is too large" do
      before { @size.bust = 120 }
      it { should_not be_valid }
    end
  end

  describe "when waist" do
    describe "is too small" do
      before { @size.waist = 50 }
      it { should_not be_valid }
    end

    describe "is too large" do
      before { @size.waist = 100 }
      it { should_not be_valid }
    end
  end

  describe "when hip" do
    describe "is too small" do
      before { @size.hip = 50 }
      it { should_not be_valid }
    end

    describe "is too large" do
      before { @size.hip = 120 }
      it { should_not be_valid }
    end
  end

  describe "when legend is too long" do
    before { @size.legend = "a" * 26 }
    it { should_not be_valid }
  end
end
