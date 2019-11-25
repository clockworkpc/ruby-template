RSpec.describe Cpc::Util::TimeStampUtil do
  include Cpc::Util::TimeStampUtil

  it 'should return now_jekyll' do
    now = [Time.now.year, Time.now.month, Time.now.day].join("-") + "-"
    expect(now_jekyll).to eq(now)
  end
end
