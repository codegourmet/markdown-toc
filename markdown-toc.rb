#!/usr/bin/env ruby
# encoding utf-8

# allow symlinking to this file
THIS_FILE = (File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__)
THIS_DIR = File.dirname(THIS_FILE)

require File.join(THIS_DIR, 'toc_tracker.rb')
require File.join(THIS_DIR, 'toc_node.rb')

require 'optparse'
require 'tempfile'

TOC_INDENT = 4

# NOTE: gitlab won't allow custom html anchors. This version
#       is compatible with the auto-generated ones (and will
#       still work in addition to the github flavored refs).
TOC_ANCHOR_PREFIX = "toc_"

# TOC markers are (ab)using this comment style:
# http://stackoverflow.com/a/20885980/3489294
# These are used to be able to re-write an existing generated TOC
TOC_START_MARKER = "[//]: # (TOC)"
TOC_END_MARKER = "[//]: # (/TOC)"

def parse_options(args)
  options = {}

  option_parser = OptionParser.new do |parser|
    parser.banner = "Usage: markdown-toc.rb [options] input.md [output.md]"
    parser.separator ""
    parser.separator "Specific options:"

    parser.on("-s", "--strip", "remove generated TOC content") do
      options[:strip] = true
    end

    parser.on("-i", "--ignore-root", "ignore root heading (e.g. project name)") do
      options[:ignore_root] = true
    end

    parser.on("-r", "--replace", "replace input file") do
      options[:replace] = true
    end


    parser.separator ""
    parser.separator "Common options:"

    parser.on_tail("-h", "--help", "Show this message") do
      puts "\n#{parser}\n"
      exit
    end
  end

  option_parser.parse!

  if ARGV.count == 0
    puts "\n#{option_parser}\n"
    exit
  end

  options[:infile] = ARGV[0]

  if ARGV.count == 2
    options[:outfile] = ARGV[1]
    if options[:replace] == true
      raise ArgumentError.new("cannot combine '-r' option with outfile parameter")
    end
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
  character_heading_regexp = /
    ^(\#+)\s*                         # heading tag
    (?:<a\sname="#{TOC_ANCHOR_PREFIX}\d+"><\/a>)?  # already generated anchor
    ((?:\d\.?)*)\s*                   # heading number
    (.+)$                             # heading content
  /x

  content = content.gsub(character_heading_regexp) do
    marker =  Regexp.last_match[1]
    # skip match[2]: this is the "old" numbering
    title = Regexp.last_match[3]

    depth = marker.length # 1-based to account for root node

    new_node = @toc_tracker.add_node(depth, title)
    title = numbered_title(new_node)
    anchor_link = "<a name=\"#{anchor_name(node_index)}\"></a>"
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
    link = "##{anchor_name(node_index)}"

    indentation = '&nbsp;' * (TOC_INDENT * (node.depth - 1))
    "#{indentation}[#{title}](#{link})"
  end

  toc = toc.join("<br>\n")
  toc = [TOC_START_MARKER, toc, TOC_END_MARKER].join("\n")

  content = content.gsub(/^\[TOC\]$/, toc) # replace marker if no toc yet
  content = content.gsub(/#{TOC_START_MARKER}.*#{TOC_END_MARKER}/, toc) # replace generated TOC
  content
end

def numbered_title(node)
  heading_numbers = node.get_index_path[1..-1]
  heading_numbers.map!{|number| number + 1}
  heading_numbers = heading_numbers.join('.') + "."

  "#{heading_numbers} #{node.content}"
end

def anchor_name(node_index)
  "#{TOC_ANCHOR_PREFIX}#{node_index}"
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
