module Kaminari
  class Verify
    def initialize(path)
      @path = path
    end
 
    def verify
      puts "分割した #{@path} を検証します.".color(:blue)

      return 'Verification error.'.color(:red) unless merge_files == read_orignal_file
      'Verified.'.color(:green)
    end

    def read_orignal_file
      original = ""
      File.open(@path, "r") do |f|
        original = f.read
      end
      original
    end

    def merge_files
      # 苦肉の策...
      files = `ls #{@path}-*`
      contents = []
      files.split("\n").each do |file|
        File.open(file, "r") do |f|
          contents << f.read.tr("\n", "")
        end
      end
      splited = contents.join(",")
      splited
    end
  end
end
