#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
require 'optparse'

OPTIONS = {
  root: 'JobsByPods',
  report: 'PodspecDependencyReport/PodBoundaryAudit.md',
  fix_safe_core_support_imports: false,
  dry_run: false
}.freeze

SKIP_POD_DIRS = [
  'ManualByOCPods@Pods'
].freeze

opts = OPTIONS.dup

OptionParser.new do |parser|
  parser.banner = <<~TEXT
    用法：
      ruby pod_boundary_audit.rb [--root JobsByPods] [--report PodspecDependencyReport/PodBoundaryAudit.md]
                                 [--fix-safe-core-support-imports] [--dry-run]
  TEXT

  parser.on('--root PATH', '指定扫描根目录，默认 JobsByPods') do |value|
    opts[:root] = value
  end

  parser.on('--report PATH', '指定 Markdown 报告输出路径') do |value|
    opts[:report] = value
  end

  parser.on('--fix-safe-core-support-imports', '自动把 Core/*.h 里安全可迁移的 Support import 下沉到配对的 .m/.mm') do
    opts[:fix_safe_core_support_imports] = true
  end

  parser.on('--dry-run', '只输出报告和命中结果，不写入文件') do
    opts[:dry_run] = true
  end
end.parse!

def header_basename(path)
  File.basename(path)
end

def symbol_name_from_header(header_name)
  File.basename(header_name, '.h')
end

def remove_comments(text)
  without_block_comments = text.gsub(%r{/[*].*?[*]/}m, '')
  without_block_comments.gsub(%r{//.*$}, '')
end

def strip_import_lines(text)
  text.lines.reject { |line| line.match?(/^\s*#import\s+/) }.join
end

def leading_import_insert_index(lines)
  last_import_index = nil

  lines.each_with_index do |line, index|
    stripped = line.strip

    if stripped.start_with?('#import ')
      last_import_index = index
      next
    end

    next if stripped.empty?
    next if stripped.start_with?('//')
    next if stripped.start_with?('/*')
    next if stripped.start_with?('*')
    next if stripped.start_with?('*/')
    next if stripped.start_with?('#pragma')

    break
  end

  last_import_index ? last_import_index + 1 : 0
end

def paired_implementation_for(header_path)
  %w[.m .mm].each do |ext|
    candidate = header_path.sub(/\.h\z/, ext)
    return candidate if File.exist?(candidate)
  end

  nil
end

def protect_block_quote_import?(lines, index)
  depth = 0

  lines[0..index].each do |line|
    stripped = line.strip
    depth += 1 if stripped.start_with?('#if __has_include(')
    depth -= 1 if stripped == '#endif' && depth.positive?
  end

  depth.positive?
end

def pod_dirs(root)
  Dir.glob(File.join(root, '*@Pods')).sort.reject do |path|
    SKIP_POD_DIRS.include?(File.basename(path))
  end
end

audit_rows = []
safe_fix_rows = []
manual_rows = []
single_channel_external_rows = []
per_pod_support_import_counts = Hash.new(0)
per_pod_single_channel_counts = Hash.new(0)
changed_files = []
changed_imports = 0

pod_dirs(opts[:root]).each do |pod_dir|
  pod_name = File.basename(pod_dir, '@Pods')
  support_headers = Hash.new { |hash, key| hash[key] = [] }
  all_local_headers = {}

  Dir.glob(File.join(pod_dir, '{Core,Support}', '**', '*.h')).each do |header|
    basename = header_basename(header)
    support_headers[basename] << header if header.include?('/Support/')
    all_local_headers[basename] = true
  end

  Dir.glob(File.join(pod_dir, 'Core', '**', '*.h')).each do |header|
    lines = File.readlines(header, chomp: false)
    support_imports = []

    lines.each_with_index do |line, index|
      match = line.match(/^\s*#import\s+[<"]([^>"]+)[>"]/)
      next unless match

      import_token = match[1]
      basename = header_basename(import_token)
      next unless support_headers.key?(basename) && !support_headers[basename].empty?

      support_imports << {
        line_index: index,
        line_number: index + 1,
        import_line: line,
        import_token: import_token,
        import_header: basename,
        support_path: support_headers[basename].first
      }
    end

    unless support_imports.empty?
      per_pod_support_import_counts[pod_name] += support_imports.size

      code_without_imports = remove_comments(strip_import_lines(File.read(header)))
      paired_impl = paired_implementation_for(header)
      used_symbols = support_imports.select do |import_info|
        code_without_imports.include?(symbol_name_from_header(import_info[:import_header]))
      end

      audit_rows << {
        pod_name: pod_name,
        header: header,
        implementation: paired_impl,
        imports: support_imports,
        used_symbols: used_symbols
      }

      if used_symbols.empty? && paired_impl
        safe_fix_rows << audit_rows.last
      else
        manual_rows << audit_rows.last
      end
    end

    lines.each_with_index do |line, index|
      match = line.match(/^\s*#import\s+"([^"]+)"/)
      next unless match
      next if protect_block_quote_import?(lines, index)

      import_token = match[1]
      basename = header_basename(import_token)
      same_dir_header = File.exist?(File.join(File.dirname(header), basename))
      local_same_pod_header = all_local_headers.key?(basename)
      next if same_dir_header || local_same_pod_header

      per_pod_single_channel_counts[pod_name] += 1
      single_channel_external_rows << {
        pod_name: pod_name,
        file: header,
        line_number: index + 1,
        import_token: import_token,
        import_line: line.strip
      }
    end
  end
end

if opts[:fix_safe_core_support_imports]
  safe_fix_rows.each do |row|
    header_lines = File.readlines(row[:header], chomp: false)
    impl_lines = File.readlines(row[:implementation], chomp: false)
    imports_to_move = row[:imports]

    new_header_lines = header_lines.reject.with_index do |_line, index|
      imports_to_move.any? { |import_info| import_info[:line_index] == index }
    end

    impl_existing = impl_lines.map(&:strip)
    imports_to_add = imports_to_move.map { |import_info| import_info[:import_line] }.reject do |line|
      impl_existing.include?(line.strip)
    end

    unless imports_to_add.empty?
      insert_index = leading_import_insert_index(impl_lines)
      impl_lines.insert(insert_index, *imports_to_add)
      changed_imports += imports_to_add.size
    end

    next if new_header_lines == header_lines && impl_lines == File.readlines(row[:implementation], chomp: false)

    changed_files << row[:header] unless changed_files.include?(row[:header])
    changed_files << row[:implementation] unless changed_files.include?(row[:implementation])

    next if opts[:dry_run]

    FileUtils.chmod('u+w', row[:header]) rescue nil
    FileUtils.chmod('u+w', row[:implementation]) rescue nil
    File.write(row[:header], new_header_lines.join)
    File.write(row[:implementation], impl_lines.join)
  end
end

report_lines = []
report_lines << "# `Pod Boundary Audit`"
report_lines << ''
report_lines << '![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")'
report_lines << ''
report_lines << '[toc]'
report_lines << ''
report_lines << '---'
report_lines << ''
report_lines << '## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << '这份报告用于审计 `JobsByPods` 下本地 Pod 的 `Core / Support` 边界是否符合当前约定：'
report_lines << ''
report_lines << '- `Core` 是准备对外暴露的公开能力。'
report_lines << '- `Support` 是只服务 `Core` 的内部辅助实现。'
report_lines << '- `Core/*.h` 不应该直接暴露当前 Pod 的 `Support` 头文件。'
report_lines << '- 涉及其它 Pod 的头文件引用，应该优先收敛为 `#if __has_include ... #else ... #endif` 的双通道保护写法。'
report_lines << '- 当前 Pod 自己引用自己的公开头文件时，不要求额外套双通道保护。'
report_lines << ''
report_lines << "本次扫描根目录：`#{opts[:root]}`。"
report_lines << ''
report_lines << '## 一、结果总览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << "| 项目 | 数量 | 说明 |"
report_lines << "| --- | --- | --- |"
report_lines << "| `Core/*.h` 直接引用当前 Pod `Support` 的文件数 | #{audit_rows.size} | 按头文件去重后的命中文件数。 |"
report_lines << "| `Core/*.h` 直接引用当前 Pod `Support` 的 import 数 | #{per_pod_support_import_counts.values.sum} | 单条 import 级别统计。 |"
report_lines << "| 可自动下沉到 `.m/.mm` 的安全文件数 | #{safe_fix_rows.size} | 头文件里未直接使用 Support 类型，且存在配对实现文件。 |"
report_lines << "| 需要人工判定的结构性文件数 | #{manual_rows.size} | 包括公开 API 直接依赖 Support 类型、无配对实现文件等情况。 |"
report_lines << "| 头文件里疑似单通道外部 import 数 | #{single_channel_external_rows.size} | 未处于 `__has_include` 保护块内，且不像当前 Pod 内部头。 |"
report_lines << ''
report_lines << if opts[:fix_safe_core_support_imports]
                  "| 自动修整模式 | `#{opts[:dry_run] ? 'dry-run' : 'write'}` | 仅对安全候选执行 `Core.h -> Core.m` 下沉。 |"
                else
                  "| 自动修整模式 | `off` | 只扫描，不写文件。 |"
                end
report_lines << if opts[:fix_safe_core_support_imports]
                  "| 本次实际改动文件数 | #{changed_files.size} | 同时统计 `.h` 和 `.m/.mm`。 |"
                else
                  "| 本次实际改动文件数 | 0 | 未开启自动修整。 |"
                end
report_lines << if opts[:fix_safe_core_support_imports]
                  "| 本次下沉 import 数 | #{changed_imports} | 仅统计真正新增到 `.m/.mm` 的 import。 |"
                else
                  "| 本次下沉 import 数 | 0 | 未开启自动修整。 |"
                end
report_lines << ''
report_lines << '## 二、按 Pod 统计 `Core.h -> Support` 越界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << "| Pod | import 数 |"
report_lines << "| --- | --- |"
per_pod_support_import_counts.sort_by { |_pod, count| -count }.each do |pod_name, count|
  report_lines << "| `#{pod_name}` | #{count} |"
end

report_lines << ''
report_lines << '## 三、安全可自动修整文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << '以下文件满足两个条件：'
report_lines << ''
report_lines << '- `Core/*.h` 里虽然引了 `Support`，但头文件正文没有直接暴露对应 Support 类型。'
report_lines << '- 这个头文件有配对的 `.m` / `.mm`，可以把 import 下沉到实现文件。'
report_lines << ''
safe_fix_rows.each do |row|
  report_lines << "- `#{row[:header]}`"
  report_lines << "  - 配对实现：`#{row[:implementation]}`"
  report_lines << "  - 下沉 import：`#{row[:imports].map { |import_info| import_info[:import_token] }.join('`、`')}`"
end

report_lines << ''
report_lines << '## 四、需要人工判定的结构性问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << '这些文件不建议脚本直接硬改，原因通常是：'
report_lines << ''
report_lines << '- `Core` 公开头本身已经直接暴露了 `Support` 类型。'
report_lines << '- 头文件没有对应实现文件，无法简单下沉 import。'
report_lines << '- 这类情况往往意味着文件分层本身就需要重判：是把某些基础类从 `Support` 提升到 `Core`，还是把公开 API 改成不暴露 Support 类型。'
report_lines << ''
manual_rows.each do |row|
  reason_parts = []
  reason_parts << '无配对实现文件' unless row[:implementation]
  unless row[:used_symbols].empty?
    reason_parts << "公开头直接使用了 Support 类型：`#{row[:used_symbols].map { |item| symbol_name_from_header(item[:import_header]) }.uniq.join('`、`')}`"
  end

  report_lines << "- `#{row[:header]}`"
  report_lines << "  - 原因：#{reason_parts.join('；')}"
  report_lines << "  - 命中 import：`#{row[:imports].map { |import_info| import_info[:import_token] }.join('`、`')}`"
  report_lines << "  - 配对实现：`#{row[:implementation] || '无'}`"
end

report_lines << ''
report_lines << '## 五、疑似单通道外部 import <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << '这里只列没有落在 `#if __has_include ... #else ... #endif` 保护块里的 `#import "XXX.h"`，并且 `XXX.h` 看起来不像当前 Pod 内部头文件的情况。'
report_lines << ''
report_lines << "| Pod | 数量 |"
report_lines << "| --- | --- |"
per_pod_single_channel_counts.sort_by { |_pod, count| -count }.each do |pod_name, count|
  report_lines << "| `#{pod_name}` | #{count} |"
end

report_lines << ''
report_lines << '示例命中：'
report_lines << ''
single_channel_external_rows.first(80).each do |row|
  report_lines << "- `#{row[:file]}:#{row[:line_number]}` -> `#{row[:import_line]}`"
end

report_lines << ''
report_lines << '## 六、建议收口顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'
report_lines << ''
report_lines << '建议优先按下面顺序继续推进：'
report_lines << ''
report_lines << '- 先批量处理脚本已识别出的安全候选，把不必要的 `Support` 暴露从公开头挪走。'
report_lines << '- 再处理 `JobsBaseUI`、`JobsNavBar`、`JobsBasePopupView` 这类“公开类继承了 Support 基类”的结构性问题。'
report_lines << '- 最后统一清洗头文件里的单通道外部 import，把其它 Pod 的依赖都改成双通道保护写法。'
report_lines << ''
report_lines << '<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>'

unless opts[:dry_run]
  FileUtils.mkdir_p(File.dirname(opts[:report]))
  File.write(opts[:report], report_lines.join("\n") + "\n")
end

puts "report=#{opts[:report]}"
puts "core_support_header_files=#{audit_rows.size}"
puts "core_support_imports=#{per_pod_support_import_counts.values.sum}"
puts "safe_fix_files=#{safe_fix_rows.size}"
puts "manual_review_files=#{manual_rows.size}"
puts "single_channel_external_imports=#{single_channel_external_rows.size}"
puts "changed_files=#{changed_files.size}"
puts "changed_imports=#{changed_imports}"
