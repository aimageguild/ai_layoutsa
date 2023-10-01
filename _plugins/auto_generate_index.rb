Jekyll::Hooks.register :site, :after_init do |site|
    site.collections.each do |collection|
      collection[1].docs.each do |document|
        next unless document.is_a?(Jekyll::Document)
  
        dir_path = File.dirname(document.path)
        index_path = File.join(dir_path, 'index.html')
        next if File.exist?(index_path)
  
        File.open(index_path, 'w') do |file|
          file.write("---\n")
          file.write("layout: default\n")
          file.write("title: Index for #{dir_path}\n")
          file.write("---\n\n")
          file.write("# Index for #{dir_path}\n")
          file.write("\n[Back to parent](..)\n")
        end
      end
    end
  end
  