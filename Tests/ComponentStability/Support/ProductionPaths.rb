# frozen_string_literal: true
# 从测试包定位实际主工程源码；不依赖当前工作目录，也不以 fixture 代替生产实现。
module JobsComponentStability
  module_function

  def project_root
    File.expand_path('../../..', __dir__)
  end

  def production_path(relative)
    path = File.expand_path(relative, project_root)
    unless path.start_with?(project_root + File::SEPARATOR) && File.exist?(path)
      raise "主工程测试所需生产文件不存在：#{relative}"
    end
    path
  end
end
