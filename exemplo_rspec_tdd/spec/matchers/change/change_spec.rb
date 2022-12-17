require 'counter'

describe "Change Matcher" do
    it { expect{Counter.add}.to change{Counter.qtt}}
    it { expect{Counter.add}.to change{Counter.qtt}.by(1)}
    it { expect{Counter.add}.to change{Counter.qtt}.from(2).to(3)}
end