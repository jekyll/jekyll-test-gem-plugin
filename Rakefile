require "bundler/gem_tasks"

namespace :project do
  require "forwardable"

  module Project
    class Spec
      extend Forwardable

      def_delegators :@gemspec, :name, :version

      def initialize(name)
        gemspec_file = "#{name}.gemspec"
        @gemspec = Bundler.load_gemspec(gemspec_file)
      end
    end
  end

  spec = Project::Spec.new("jekyll_test_plugin")

  desc "Print basename of built gem."
  task :gem_name do
    puts "#{spec.name}-#{spec.version}"
  end

  desc "Print lib version prefixed with 'v'."
  task :tag_version do
    puts "v#{spec.version}"
  end
end
