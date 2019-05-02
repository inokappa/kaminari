module Kaminari
  module Cli
    def self.split_help
      at_exit do
        puts <<-HELP
  Usage:
    kaminari split
  Options:
    --file=FILE PATH          # 分割するファイルを指定.
    --num=NUM                 # 分割したい行数を指定.
    --sep=SEPARATER           # 分割する文字列を指定 (デフォルトはカンマ)
  指定したファイルを, 指定した行数で分割する.
  HELP
      end
    end

    def self.verify_help
      at_exit do
        puts <<-HELP
  Usage:
    kaminari verify
  Options:
    --file=FILE PATH          # 分割したファイルを指定.
  分割したファイルを元のファイルと比較して差分が無いことを確認する.
  HELP
      end
    end

    def self.split(args)
      class << args; include Getopts; end
      opts = args.getopts(
        'h',
        'help',
        'file:',
        'num:',
        'sep:'
      )
      split_help if opts['h'] || opts['help']
      km = Kaminari::Split.new(opts['file'])
      km.split(opts['num'], opts['sep'])
      puts '処理が終了しました.'
    end

    def self.verify(args)
      class << args; include Getopts; end
      opts = args.getopts(
        'h',
        'help',
        'file:'
      )
      verify_help if opts['h'] || opts['help']
      km = Kaminari::Verify.new(opts['file'])
      puts km.verify
      # puts '処理が終了しました.'
    end
  end
end
