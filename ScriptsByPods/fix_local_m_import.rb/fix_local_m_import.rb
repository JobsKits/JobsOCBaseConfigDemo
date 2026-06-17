#!/usr/bin/env ruby
# frozen_string_literal: true

# 这个脚本，负责修复成对的*.h和*.m文件里面，*.m对于*.h的引用，不能用<>的形式
require 'fileutils'

root = ARGV[0] || Dir.pwd
dry_run = ARGV.include?('--dry-run')

changed_files = 0
changed_imports = 0

Dir.glob(File.join(root, '**', '*.{m,mm}')).each do |file|
  next unless File.file?(file)
  next if file.include?('/.git/')
  next if file.include?('/__MACOSX/')

  dir = File.dirname(file)
  text = File.read(file)

  new_text = text.gsub(/#import\s+<([^>]+\.h)>/) do |origin|
    import_path = Regexp.last_match(1)
    header_name = File.basename(import_path)

    # 只要当前 .m/.mm 同目录下存在这个 .h，就还原成本地引用
    if File.exist?(File.join(dir, header_name))
      changed_imports += 1
      "#import \"#{header_name}\""
    else
      origin
    end
  end

  next if new_text == text

  changed_files += 1

  if dry_run
    puts "[dry-run] #{file}"
  else
    FileUtils.chmod('u+w', file) rescue nil
    File.write(file, new_text)
    puts "[fixed] #{file}"
  end
end

puts "changed_files=#{changed_files}, changed_imports=#{changed_imports}"
