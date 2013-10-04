require "jekyll_test/version"
require "jekyll"

module JekyllTest
  class TestPage < Jekyll::Page
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir  = dir
      @name = name
      self.process(name)
      self.content = "this is a test"
    end
  end

  class TestGenerator < Jekyll::Generator
    def generate(site)
      site.pages << Page.new(site, site.source, '', 'test.txt')
    end
  end
end
