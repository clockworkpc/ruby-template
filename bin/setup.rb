require 'pry'
require 'fileutils'

project_details_hsh = JSON.parse(File.read('bin/project_details.json'))
module_str = project_details_hsh["module"]
spec_str = project_details_hsh["spec"]

def project_files
  grep_ary = `grep -rnw -e "#{project_details["module"]}\\|#{project_details["spec"]}"`.split("\n")
  grep_ary.map {|x| x.split(':').first unless x.match?(".git")}.compact.uniq
end

def rename_module_and_spec(path_ary, module_str, spec_str)
  path_ary = project_files
  path_ary.each do |path|
    r = File.read(path)
    w = r.gsub(project_details["module"], module_str).gsub(project_details["spec"], spec_str)

    f = File.open(path, 'w')
    f.write(w)
    f.close
    puts "Renamed Modules and specs in #{path}"
  end
end

def rename_files(path_ary)
  path_ary.each do |path|
    if File.basename.match?(project_details["spec"])
      dirname = File.dirname(f)
      new_basename = File.basename.sub(project_details["spec"], spec_str)
      new_path = [dirname, new_basename].join('/')
      puts "New path: #{new_path}"
      File.rename(path, dirname, new_path)
    end
  end
end

def rename_project
  path_ary_01 = project_files
  rename_files(path_ary_01)

  path_ary_02 = project_files
  rename_module_and_spec(path_ary_02)
end


rename_project
