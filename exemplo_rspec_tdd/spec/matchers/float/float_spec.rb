RSpec::Matchers.define_negated_matcher :be_outside, :be_within

describe 'be_within' do
    it {expect(11.5).to be_within(0.5).of(12)}
    it {expect(13.5).to be_outside(0.5).of(12)}
    it {expect([11.5,12.5,12.4]).to all(be_within(0.5).of(12))}
end