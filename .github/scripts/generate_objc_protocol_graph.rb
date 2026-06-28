#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"
require "pathname"
require "set"

SKIPPED_PARENT_PROTOCOLS = Set.new(%w[
  NSObject
])

QUALIFIER_TOKENS = Set.new(%w[
  API_AVAILABLE
  API_DEPRECATED
  API_UNAVAILABLE
  NS_AVAILABLE
  NS_DEPRECATED
  NS_UNAVAILABLE
  NS_SWIFT_NAME
  nullable
  nonnull
  readonly
  readwrite
  class
  weak
  strong
  copy
  assign
  retain
  nonatomic
  atomic
  getter
  setter
  __kindof
  _Nullable
  _Nonnull
])

def usage!
  warn "Usage: ruby .github/scripts/generate_objc_protocol_graph.rb <source_dir> <output_mmd>"
  exit 64
end

def strip_comments(content)
  content
    .gsub(%r{/\*.*?\*/}m, "\n")
    .gsub(%r{//.*$}, "")
end

def cleanup_signature(signature)
  text = signature.to_s.strip.sub(/;\z/, "")
  text = text.gsub(/\s+/, " ").strip
  text = text.gsub(/\s+API_[A-Z_]+\(.*\)\s*$/, "")
  text = text.gsub(/\s+NS_[A-Z_]+\(.*\)\s*$/, "")
  text.strip
end

def sanitize_identifier(value)
  identifier = value.to_s.gsub(/[^0-9A-Za-z_]/, "_").gsub(/_+/, "_")
  identifier = "unknown" if identifier.empty?
  identifier = "_#{identifier}" unless identifier.match?(/\A[A-Za-z_]/)
  identifier
end

def sanitize_type(value)
  tokens = value.to_s.scan(/[A-Za-z_][A-Za-z0-9_]*/)
  tokens = tokens.reject { |token| QUALIFIER_TOKENS.include?(token) || token.start_with?("Prop_") }
  tokens = tokens.uniq.take(4)
  tokens.empty? ? "id" : tokens.join("_")
end

def parse_parent_protocols(parents_text)
  parents_text.to_s
              .split(",")
              .map { |item| item.scan(/[A-Za-z_][A-Za-z0-9_]*/).first }
              .compact
              .reject(&:empty?)
end

def compact_statement(raw_statement)
  lines = raw_statement.lines.map(&:strip).reject do |line|
    line.empty? ||
      line.start_with?("#") ||
      line.start_with?("@optional") ||
      line.start_with?("@required") ||
      line.start_with?("@class") ||
      line.start_with?("typedef")
  end
  lines.join(" ").strip
end

def parse_property_statement(statement)
  signature = cleanup_signature(statement)
  return nil unless signature.start_with?("@property") || signature.start_with?("Prop_")

  property_signature = signature.split(/\s+(?:API_[A-Z_]+|NS_[A-Z_]+)\b/).first.to_s.strip
  name = property_signature[/([A-Za-z_][A-Za-z0-9_]*)\s*\z/, 1]
  return nil unless name

  type_part = property_signature.sub(/#{Regexp.escape(name)}\s*\z/, "").strip
  if type_part.start_with?("@property")
    type_part = type_part.sub(/\A@property\s*(?:\([^)]*\))?\s*/, "")
  else
    type_part = type_part.sub(/\AProp_[A-Za-z_][A-Za-z0-9_]*\s*\([^)]*\)\s*/, "")
  end

  {
    name: sanitize_identifier(name),
    type: sanitize_type(type_part)
  }
end

def parse_method_statement(statement)
  signature = cleanup_signature(statement)
  match = signature.match(/\A([+-])\s*\([^)]*\)\s*(.+)\z/)
  return nil unless match

  method_kind = match[1] == "+" ? "class" : "method"
  method_tail = match[2].strip
  labels = method_tail.scan(/([A-Za-z_][A-Za-z0-9_]*)\s*:/).flatten
  raw_name = labels.any? ? labels.join("_") : method_tail[/[A-Za-z_][A-Za-z0-9_]*/]
  return nil unless raw_name

  "#{method_kind}_#{sanitize_identifier(raw_name)}"
end

def parse_members(protocol_body)
  properties = []
  methods = []

  protocol_body.split(";").each do |raw_statement|
    statement = compact_statement(raw_statement)
    next if statement.empty?

    statement = "#{statement};"
    if (property = parse_property_statement(statement))
      properties << property
      next
    end

    method = parse_method_statement(statement)
    methods << method if method
  end

  {
    properties: properties.uniq,
    methods: methods.uniq
  }
end

def parse_protocols(source_dir)
  protocols = {}
  header_files = Dir.glob(source_dir.join("**/*.h").to_s).sort

  header_files.each do |header_path|
    content = File.read(header_path)
    text = strip_comments(content)

    text.scan(/@protocol\s+([A-Za-z_][A-Za-z0-9_]*)\s*(?!;)(?:<([^>]*)>)?(.*?)@end/m) do |name, parents_text, body|
      protocol = protocols[name] ||= {
        name: name,
        parents: [],
        properties: [],
        methods: [],
        file: Pathname.new(header_path).relative_path_from(source_dir).to_s
      }

      members = parse_members(body)
      protocol[:parents].concat(parse_parent_protocols(parents_text))
      protocol[:properties].concat(members[:properties])
      protocol[:methods].concat(members[:methods])
      protocol[:parents].uniq!
      protocol[:properties].uniq!
      protocol[:methods].uniq!
    end
  end

  protocols
end

def render_mermaid(protocols, source_dir)
  protocol_names = protocols.keys.to_set
  edges = []
  external_parents = Set.new

  protocols.values.each do |protocol|
    protocol[:parents].each do |parent|
      next if SKIPPED_PARENT_PROTOCOLS.include?(parent)

      parent_name = sanitize_identifier(parent)
      child_name = sanitize_identifier(protocol[:name])
      edges << [child_name, parent_name]
      external_parents << parent_name unless protocol_names.include?(parent)
    end
  end

  lines = []
  lines << "%% Auto-generated from #{source_dir}"
  lines << "%% Includes Objective-C protocol inheritance plus Jobs Prop_ macros, @property declarations, and method selectors."
  lines << "classDiagram"
  lines << "direction TB"
  lines << ""

  protocols.values.sort_by { |protocol| protocol[:name] }.each do |protocol|
    class_name = sanitize_identifier(protocol[:name])
    lines << "class #{class_name} {"
    lines << "  <<protocol>>"

    protocol[:properties].each do |property|
      lines << "  +prop_#{property[:name]} : #{property[:type]}"
    end

    protocol[:methods].each do |method_name|
      lines << "  +#{method_name}()"
    end

    lines << "}"
    lines << ""
  end

  external_parents.sort.each do |parent|
    lines << "class #{parent} {"
    lines << "  <<external protocol>>"
    lines << "}"
    lines << ""
  end

  edges.uniq.sort.each do |child, parent|
    lines << "#{child} --|> #{parent}"
  end

  "#{lines.join("\n")}\n"
end

usage! unless ARGV.length == 2

source_dir = Pathname.new(ARGV[0]).expand_path
output_mmd = Pathname.new(ARGV[1]).expand_path
usage! unless source_dir.directory?

protocols = parse_protocols(source_dir)
if protocols.empty?
  warn "No Objective-C protocols found under #{source_dir}"
  exit 1
end

FileUtils.mkdir_p(output_mmd.dirname)
File.write(output_mmd, render_mermaid(protocols, source_dir))
warn "Generated #{output_mmd} from #{protocols.length} protocols."
