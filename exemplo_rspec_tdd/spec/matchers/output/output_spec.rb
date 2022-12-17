describe "Output matcher" do
    it {expect{puts "Luam"}.to output.to_stdout}
    it {expect{print "Luam"}.to output("Luam").to_stdout}
    it {expect{puts "Luam"}.to output(/Luam/).to_stdout}

    it {expect{warn "Luam"}.to output.to_stderr}
    it {expect{warn "Luam"}.to output("Luam\n").to_stderr}
    it {expect{warn "Luam"}.to output(/Luam/).to_stderr}
end