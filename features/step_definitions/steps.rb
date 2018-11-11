Given(/^the program has finished$/) do
    @cucumber = `make test`
end

Then(/^the output is correct for each test$/) do
    lines = @cucumber.split("\n")

    lines.length.should == 4

    lines[0].should == 'gst -f example.st'

    lines[1].should == '+++ OK, passed 100 tests.'
    lines[2].should =~ /^\*\*\* Failed! \((-)?[0-9]+ \)$/
    lines[3].should == '+++ OK, passed 100 tests.'
end
