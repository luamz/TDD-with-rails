$count = 0
describe "let!" do
    calling_order = []
    let!(:counter) do
        calling_order << :let!
        $count+=1
    end
    it "Let method before each tests" do
        calling_order << :example
        expect(calling_order).to eq([:let!,:example])
        expect(counter).to eq(1)
    end
end