require 'pry'
require 'fileutils'

class ProjectRenamer
  project_details_hsh = JSON.parse(File.read('bin/project_details.json'))
  old_module_str = project_details_hsh["module"]
  old_spec_str = project_details_hsh["spec"]
  new_module_str = 'Foobar'
  new_spec_str = 'foobar'

  def project_files
    grep_ary = `grep -rnw -e "#{old_module_str}\\|#{old_spec_str}"`.split("\n")
    grep_ary.map {|x| x.split(':').first unless x.match?(".git")}.compact.uniq
  end

  def rename_module_and_spec(path_ary)
    path_ary = project_files
    path_ary.each do |path|
      r = File.read(path)
      w = r.gsub(old_module_str, new_module_str).gsub(old_spec_str, new_spec_str)

      f = File.open(path, 'w')
      f.write(w)
      f.close
      puts "Renamed Modules and specs in #{path}"
    end
  end

  def rename_files(path_ary)
    path_ary.each do |path|
      if File.basename.match?(old_spec_str)
        dirname = File.dirname(f)
        new_basename = File.basename.sub(old_spec_str, new_spec_str)
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
end

r = ProjectRenamer.new
r.rename_project
