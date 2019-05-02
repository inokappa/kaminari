def __main__(argv)
  argv.shift
  case argv[0]
  when "version"
    puts "Kaminari: v#{Kaminari::VERSION}"
  when "split"
    Kaminari::Cli.split(argv)
  when "verify"
    Kaminari::Cli.verify(argv)
  else
    puts <<-USAGE
Kaminari - ファイルをいい感じに分割する小さなコマンドです.
commands:
    split   - ファイルを分割する.
    verify  - 分割したファイルを検証する.
    version - show version
Invoke `kaminari COMMAND -h' for details.
    USAGE
  end
end
