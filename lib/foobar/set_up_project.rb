module Rubytemplate
  class SetUpProject
    # def initialize(spec_name_str, module_name_str, spec_homepage_str)
    #   @spec_name = spec_name_str
    #   @module_name = module_name_str
    #   @spec_homepage = spec_homepage_str
    # end

    def project_details
      JSON.parse(File.read('bin/project_details.json'))
    end

    def gemspec_path
      Dir.glob("*.gemspec").first
    end

    def parse_gemspec
      g = File.readlines(gemspec_path)
    end

    def project_files(module_str, spec_str)
      grep_ary = `grep -rnw -e "#{project_details["module"]}\\|#{project_details["spec"]}"`.split("\n")
      grep_ary.map {|x| x.split(':').first unless x.match?(".git")}.compact.uniq

      # path_ary.each do |n|
      #   f = File.read(n)
      #   h = f.gsub(project_details["module"], module_str).gsub(project_details["spec"], spec_str)
      #   puts h
      #   binding.pry
      # end

    end
  end
end
