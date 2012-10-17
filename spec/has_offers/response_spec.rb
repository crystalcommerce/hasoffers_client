require 'spec_helper'
require 'has_offers/response'

module HasOffers
  describe Response do
    let(:errors) { [] }
    let(:result) { mock }

    subject { Response.new(result, errors) }

    context "no errors" do
      it { should be_successful }
      its(:errors) { should == [] }
      its(:result) { should == result }
    end

    context "has errors" do
      let(:errors) { [mock] }

      it { should_not be_successful }
      its(:errors) { should == errors }
      its(:result) { should == result }
    end
  end
end
