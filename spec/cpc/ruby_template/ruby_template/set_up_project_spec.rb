RSpec.describe RubyTemplate::SetUpProject do

  context 'ruby_template' do
    # subject = RubyTemplate::SetUpProject.new('ruby_template', 'FooBar', 'http://www.ruby_template.com')

    let(:project_details) { JSON.parse(File.read('bin/project_details.json')) }

    # it "should return gemspec_path" do
    #   expect(subject.gemspec_path).to eq('ruby_template.gemspec')
    # end
    #
    # it "should list project files" do
    #   res = subject.project_files('RubyTemplate', 'ruby_template')
    # end

    # it "should rename_file" do
    #
    #   f = 'spec/fixtures/something.txt'
    #   path = File.path(f)
    #   dirname = File.dirname(f)
    #   puts "path = #{path}"
    #   puts "dirname = #{dirname}"
    #   File.rename(f, [dirname, "dummy.txt"].join('/'))
    # end
  end
end
