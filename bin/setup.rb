require 'pry'
require 'fileutils'

class ProjectRenamer

  def initialize
    project_details_hsh = JSON.parse(File.read('bin/project_details.json'))
    @old_module_str = project_details_hsh["module"]
    @old_spec_str = project_details_hsh["spec"]
    @new_module_str = 'Foobar'
    @new_spec_str = 'foobar'
  end

  def project_files
    grep_ary = `grep -rnw -e "#{@old_module_str}\\|#{@old_spec_str}"`.split("\n")
    grep_ary.map {|x| x.split(':').first unless x.match?(".git")}.compact.uniq
  end

  def rename_files
    path_ary = project_files
    path_ary.each do |path|
      if File.basename(path).match?(@old_spec_str)
        dirname = File.dirname(path)
        new_basename = File.basename(path).sub(@old_spec_str, @new_spec_str)
        new_path = [dirname, new_basename].join('/')
        puts "#{path} => #{new_path}"
        begin
          File.rename(path, new_path)
        rescue ExceptionName
          binding.pry
        end
      end
    end
  end

  def rename_folders
    path_ary = project_files
    path_ary.each do |path|
      old_dirname = File.dirname(path)
      new_dirname = old_dirname.sub(@old_spec_str, @new_spec_str)
      unless old_dirname.eql?(new_dirname)
        FileUtils.mv(old_dirname, new_dirname)
        puts "#{old_dirname} => #{new_dirname}"
      end
    end
  end

  def rename_module_and_spec
    path_ary = project_files
    path_ary.each do |path|
      r = File.read(path)
      w = r.gsub(@old_module_str, @new_module_str).gsub(@old_spec_str, @new_spec_str)

      f = File.open(path, 'w')
      f.write(w)
      f.close
      puts "Renamed Modules and specs in #{path}"
    end
  end


  def rename_project
    rename_files
    # rename_folders
    # rename_module_and_spec
  end
end

r = ProjectRenamer.new
r.rename_project
