module MarkdownToc
  class ArgumentsParser

    def self.parse!(arguments)
      options = {}

      parser = self.parse_options!(arguments, options)
      parse_file_arguments!(arguments, options, parser)

      if options[:gitlab_mode]
        options[:no_anchors] = true
        options[:text_only] = true
        options[:no_marker] = true
      end

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

          # NYI
          #parser.on("-i", "--ignore-root", "ignore root heading (e.g. project name)") do
          #  options[:ignore_root] = true
          #end

          parser.on("-a", "--no-anchors", "e.g. gitlab mode: no hrefs for chapters") do
            options[:no_anchors] = true
          end

          parser.on("-t", "--text-only", "pure text mode TOC (no hrefs for TOC)") do
            options[:text_only] = true
          end

          parser.on("-p", "--plain", "plain mode, no html indentation hack for TOC") do
            options[:plain] = true
          end

          parser.on("-m", "--no-marker", " no TOC marker (NOTE: will make -s feature impossible)") do
            options[:no_marker] = true
          end

          parser.on("-g", "--gitlab-mode", "all necessary settings + more hacks for gitlab mode (NOTE: will make -s feature impossible)") do
            options[:gitlab_mode] = true
          end

          parser.on("-r", "--replace", "replace input file") do
            options[:replace] = true
          end

          parser.separator ""
          parser.separator "Examples:"
          parser.separator "    markdown-toc.rb -r README.md     # adds toc data"
          parser.separator "    markdown-toc.rb -r -s README.md  # removes toc data"

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
        options[:outfile] = arguments[1]

        if options[:replace] == true
          if !options[:outfile].nil?
            raise ArgumentError.new("cannot combine '-r' option with outfile parameter")
          end

          options[:outfile] = options[:infile]
        end
      end

  end
end
