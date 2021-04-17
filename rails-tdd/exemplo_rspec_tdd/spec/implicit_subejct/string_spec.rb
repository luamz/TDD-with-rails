require 'not_empty_string'

describe String do
    describe NotEmptyString do
        it "Not empty" do
            expect(subject).to eq("I'm not empty!!")
        end
    end
end