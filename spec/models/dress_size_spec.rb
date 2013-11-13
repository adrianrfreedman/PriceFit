require 'spec_helper'

describe DressSize do
  
  before do
    @dress = DressSize.create(brand: "Dressy", size: 8,
                              bust: 72.0, waist: 80.0, hip: 83.0)
  end

  subject { @dress }

  it { should respond_to(:brand) }
  it { should respond_to(:size)  }
  it { should respond_to(:bust)  }
  it { should respond_to(:waist) }
  it { should respond_to(:hip)   }

  describe "when brand is not present" do
    before { @dress.brand = " " }
    it { should_not be_valid }
  end

  describe "when size is not present" do
    before { @dress.size = nil }
    it { should_not be_valid }
  end

  describe "when bust is not present" do
    before { @dress.bust = nil }
    it { should_not be_valid }
  end

  describe "when waist is not present" do
    before { @dress.waist = nil }
    it { should_not be_valid }
  end

  describe "when hip is not present" do
    before { @dress.hip = nil }
    it { should_not be_valid }
  end

  describe "when brand name is too long" do
    before { @dress.brand = "a" * 31 }
    it { should_not be_valid }
  end

  describe "when size is out of range" do
    before { @dress.size = -1 }
    it { should_not be_valid }
  end

  describe "when bust is out of range" do
    before { @dress.bust = 70 }
    it { should_not be_valid }

    before { @dress.bust = 111 }
    it { should_not be_valid }
  end

  describe "when waist is out of range" do
    before { @dress.waist = 50 }
    it { should_not be_valid }

    before { @dress.waist = 92 }
    it { should_not be_valid }
  end

  describe "when hip is out of range" do
    before { @dress.hip = 77.5 }
    it { should_not be_valid }

    before { @dress.bust = 116.5 }
    it { should_not be_valid }
  end
end
