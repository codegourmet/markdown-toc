module MarkdownToc
  class ArgumentsParser

    def self.parse!(arguments)
      options = {}

      parser = self.parse_options!(arguments, options)
      parse_file_arguments!(arguments, options, parser)

      options
    end

    protected

      def self.parse_options!(arguments, options)
        option_parser = OptionParser.new do |parser|
          parser.banner = "Usage: markdown-toc.rb [options] input.md [output.md]"
          parser.separator ""
          parser.separator "Specific options:"

          parser.on("-s", "--strip", "remove generated TOC content") do
            options[:strip] = true
          end

          parser.on("-i", "--ignore-root", "ignore root heading (e.g. project name)") do options[:ignore_root] = true
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

        option_parser.parse!(arguments)

        option_parser
      end

      def self.parse_file_arguments!(arguments, options, parser)
        if arguments.count == 0
          puts "\n#{parser}\n"
          exit
        end

        options[:infile] = arguments[0]

        if ARGV.count == 2
          options[:outfile] = arguments[1]

          if options[:replace] == true
            raise ArgumentError.new("cannot combine '-r' option with outfile parameter")
          end
        end
      end

  end
end
