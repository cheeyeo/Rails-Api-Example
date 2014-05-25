require 'spec_helper'
require 'constraints/api_constraints'

describe ApiConstraints do
  let(:request){ double :request }

  describe '#matches?' do
    let(:version){ 1 }

    it 'matches requests including the versioned vendor mime type' do
      constraint = described_class.new({version: version})
      headers = { accept: header_for_version(version) }
      request.stub(headers: headers)

      expect(constraint.matches?(request)).to be_true
    end

    it 'matches requests for other specified versions' do
      constraint = described_class.new({version: version+1})
      headers = { accept: header_for_version(version+1) }
      request.stub(headers: headers)

      expect(constraint.matches?(request)).to be_true
    end

    it 'does not match requests in the wrong format' do
      constraint = described_class.new({version: 1})
      headers = { accept: "wrong format" }
      request.stub(headers: headers)

      expect(constraint.matches?(request)).to be_false
    end
  end
end
