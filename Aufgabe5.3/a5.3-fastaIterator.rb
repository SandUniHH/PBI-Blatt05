#!/usr/bin/env ruby

# Bocher Diedrich Sandmeier

def readfile()

  if ARGV.length != 1
    STDERR.puts "Usage: #{$0} Filename"
    exit 1
  end

  filename = ARGV[0]

  if File.exist?(filename)
    begin
      file = File.new(filename,"r")
    rescue => err
      STDERR.puts "Cannot open file #{filename}: #{err}"
      exit 1
    end
  else
    STDERR.puts "File #{filename} does not exist!"
    exit 1
  end

  return file

end

class FastaIterator

  def initialize(filename)
    @file = filename
    @lines = @file.readlines
  end

  def each()
    complete_entry = false
    header = ''
    seq_list = []
    @lines.each_with_index {|line, i|
      if line.start_with?("\>")
          if !(header.empty?)
            yield header, seq_list
          end
          header = line.chomp!
          seq_list.clear
      else
          seq_list[i] = line.chomp!
      end
      }
    yield header, seq_list
  end

end

############

filename = readfile()

iterator = FastaIterator.new(filename)
iterator.each do |header, sequence|
  seq_formatted = sequence.join.gsub(/(\w{70})/, "\\1\n")
  puts header
  puts seq_formatted
end