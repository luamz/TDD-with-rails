$counter = 0
describe "let" do
    let(:count){ $counter += 1 }
    it "memorizes value" do
        expect(count).to eq(1) #1st time
        expect(count).to eq(1) #Cache
    end
    it "Not cached during the tests" do
        expect(count).to eq(2)
    end
end