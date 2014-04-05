shared_examples 'http code' do |code|
  it "returns http #{code}" do
    response.response_code.should == code
  end
end
