#!/usr/bin/env ruby
# encoding utf-8

require './toc_tracker.rb'
require 'tempfile'

TOC_INDENT = 4

def parse_options(args)
  if ARGV.count == 0
    raise ArgumentError.new("no input file supplied")
  end

  options = {infile: ARGV[0]}

  if ARGV.count == 2
    options[:outfile] = ARGV[1]
  end

  options
end

def process_file(file_path)
  content = File.read(file_path)

  content = number_chapters(content)
  content = write_toc(content)

  content
end

def number_chapters(content)
  node_index = 0
  character_heading_regexp = /^(#+)\s*((?:\d\.?)*)\s*(.+)$/

  content = content.gsub(character_heading_regexp) do
    marker =  Regexp.last_match[1]
    # skip match[2]: this is the "old" numbering
    title = Regexp.last_match[3]

    depth = marker.length # 1-based to account for root node

    new_node = @toc_tracker.add_node(depth, title)
    title = numbered_title(new_node)
    anchor_link = "<a name=\"md-toc_#{node_index}\"></a"
    node_index += 1

    "#{marker} #{anchor_link}#{title}"
  end

  content
end

def write_toc(content)
  nodes = @toc_tracker.get_flat_node_list[1..-1]
  toc = nodes.collect do |node|
    title = numbered_title(node)

    node_index = nodes.index(node)
    link = "#md-toc_#{node_index}"

    indentation = '&nbsp;' * (TOC_INDENT * (node.depth - 1))
    "#{indentation}[#{title}](#{link})"
  end

  content.gsub(/^\[TOC\]$/, toc.join("\n\n"))
end

def numbered_title(node)
  heading_numbers = node.get_index_path[1..-1]
  heading_numbers.map!{|number| number + 1}
  heading_numbers = heading_numbers.join('.') + "."

  "#{heading_numbers} #{node.content}"
end

def write_file(file_path, content)
  temp_file = Tempfile.new('markdown-toc')
  temp_file.write(content)
  temp_file.close

  puts "writing #{file_path}..."
  FileUtils.cp(temp_file.path, file_path)
  puts "done."

  temp_file.unlink
end

options = parse_options(ARGV)
@toc_tracker = TocTracker.new

content = process_file(options[:infile])

if !options[:outfile].nil?
  write_file(options[:outfile], content)
else
  puts content
end
