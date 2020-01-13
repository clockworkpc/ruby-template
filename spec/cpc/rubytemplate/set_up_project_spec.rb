RSpec.describe Rubytemplate::SetUpProject do

  context 'rubytemplate' do
    # subject = Rubytemplate::SetUpProject.new('foobar', 'FooBar', 'http://www.foobar.com')

    let(:project_details) { JSON.parse(File.read('bin/project_details.json')) }

    # it "should return gemspec_path" do
    #   expect(subject.gemspec_path).to eq('rubytemplate.gemspec')
    # end
    #
    # it "should list project files" do
    #   res = subject.project_files('Foobar', 'foobar')
    # end

    it "should rename_file" do

      f = 'spec/fixtures/something.txt'
      path = File.path(f)
      dirname = File.dirname(f)
      puts "path = #{path}"
      puts "dirname = #{dirname}"
      File.rename(f, [dirname, "dummy.txt"].join('/'))
    end
  end
end
