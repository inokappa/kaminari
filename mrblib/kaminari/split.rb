module Kaminari
  class Split 
    def initialize(path)
      @path = path
    end
 
    def split(num, sep)
      path = generate_temporary_file(",")

      puts "#{@path} を分割処理します.".color(:blue)
      File.open(path) do |file|
        i = 0
        file.lazy.drop(0).each_slice(num.to_i) do |lines|
          i += 1
          file_prefix = format("%04d", i)
          write_splited_file("#{@path}-#{file_prefix}", lines)
        end
      end
      remove_temporary_file
    end

    def write_splited_file(name, content)
      File.open(name, "w") do |f| 
        f.puts(content.join(",").tr("\n", ""))
      end
    end
    
    def generate_temporary_file(sep)
      return @path if multiple_lines?

      content = ""
      File.open(@path, "r") do |f|
        content = f.read.tr("#{sep}", "\n")
      end
      
      File.open("#{@path}.tmp", "w") do |f| 
        f.puts(content)
      end
      "#{@path}.tmp"
    end

    def remove_temporary_file
      File.delete("#{@path}.tmp") if File.exist?("#{@path}.tmp")
    end    

    def multiple_lines?
      f = File.open(@path, "r")
      return false if f.readlines.size == 1
      true
    end
  end
end
