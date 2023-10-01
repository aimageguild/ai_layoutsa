module Jekyll
    class CategoryPageGenerator < Generator
      safe true
  
      def generate(site)
        basepath = "Knowledge/Applied Sciences"
        site.categories.each_key do |category|
          if category.start_with?(basepath)
            dir = File.join(basepath, category)
            site.pages << CategoryPage.new(site, site.source, dir, category)
          end
        end
      end
    end
  
    class CategoryPage < Page
      def initialize(site, base, dir, category)
        @site = site
        @base = base
        @dir  = dir
        self.process('index.html')
        self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
        self.data['category'] = category
      end
    end
  end
  