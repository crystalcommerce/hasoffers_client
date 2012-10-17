require 'spec_helper'
require 'has_offers/response'

module HasOffers
  describe Response do
    let(:errors) { [] }
    let(:body) { mock }

    subject { Response.new(body, errors) }

    context "no errors" do
      it { should be_successful }
      its(:errors) { should == []   }
      its(:body)   { should == body }
    end

    context "has errors" do
      let(:errors) { [mock] }

      it { should_not be_successful }
      its(:errors) { should == errors }
      its(:body)   { should == body   }
    end
  end
end
