desc "Backup all configs"
task :backup => 'backup:all'

desc "Keep all local configs"
task :local => 'local:all'

desc "Restore all configs from backup"
task :restore => 'restore:all'

ENV['REPO_PWD'] = File.expand_path(".")

namespace :backup do
  desc "Backup vim folder"
  task :vim_folder do
    FileUtils.cp_r File.expand_path("~/.vim"), File.expand_path("~/.vim.backup") if File.exist? File.expand_path("~/.vim")
    Rake::Task["backup:vim_folder"].reenable
  end

  desc "Backup vimrc"
  task :vimrc do
    FileUtils.cp File.expand_path("~/.vimrc"), File.expand_path("~/.vimrc.backup") if File.exist? File.expand_path("~/.vimrc")
    Rake::Task["backup:vimrc"].reenable
  end

  desc "Backup gvimrc"
  task :gvimrc do
    FileUtils.cp File.expand_path("~/.gvimrc"), File.expand_path("~/.gvimrc.backup") if File.exist? File.expand_path("~/.gvimrc")
    Rake::Task["backup:gvimrc"].reenable
  end

  task :all => [:vim_folder, :vimrc, :gvimrc]
end

namespace :local do
  desc "Keep vimrc local config"
  task :vimrc do
    FileUtils.cp File.expand_path("~/.vimrc"), File.expand_path("~/.vimrc.local") if File.exist? File.expand_path("~/.vimrc")
  end

  desc "Keep gvimrc local config"
  task :gvimrc do
    FileUtils.cp File.expand_path("~/.gvimrc"), File.expand_path("~/.gvimrc.local") if File.exist? File.expand_path("~/.gvimrc")
  end

  task :all => [:vimrc, :gvimrc]
end

namespace :restore do
  desc "Restore vim folder from backup"
  task :vim_folder do
    FileUtils.cp_r File.expand_path("~/.vim.backup"), File.expand_path("~/.vim") if File.exist? File.expand_path("~/.vim.backup")
  end

  desc "Restore vimrc from backup"
  task :vimrc do
    FileUtils.cp File.expand_path("~/.vimrc.backup"), File.expand_path("~/.vimrc") if File.exist? File.expand_path("~/.vimrc.backup")
  end

  desc "Restore gvimrc from backup"
  task :gvimrc do
    FileUtils.cp File.expand_path("~/.gvimrc.backup"), File.expand_path("~/.gvimrc") if File.exist? File.expand_path("~/.gvimrc.backup")
  end

  task :all => [:vim_folder, :vimrc, :gvimrc]
end

namespace :install do
  namespace :vim_folder do
    desc "Install vim folder using copy"
    task :copy => ["backup:vim_folder"] do
      FileUtils.cp_r File.expand_path(ENV['REPO_PWD']), File.expand_path("~/.vim")
    end

    desc "Install vim folder using link"
    task :link => ["backup:vim_folder", "remove:vim_folder"] do
      FileUtils.ln_s File.expand_path(ENV['REPO_PWD']), File.expand_path("~/.vim")
    end
  end
end

namespace :remove do
  task :vim_folder do
    FileUtils.rm_r File.expand_path("~/.vim") if File.exist? File.expand_path("~/.vim")
  end

  task :vimrc do
    FileUtils.rm File.expand_path("~/.vimrc") if File.exist? File.expand_path("~/.vimrc")
  end

  task :gvimrc do
    FileUtils.rm File.expand_path("~/.gvimrc") if File.exist? File.expand_path("~/.gvimrc")
  end

  task :all => ["remove:vim_folder", "remove:vimrc", "remove:gvimrc"]
end
