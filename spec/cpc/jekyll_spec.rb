RSpec.describe Cpc::Jekyll do
  include Cpc::Jekyll


  it "has a version number" do
    expect(Cpc::Jekyll::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true);
  end

  it 'hello_jekyll' do
    expect(hello_jekyll).to eq("hello_jekyll")
  end
end
