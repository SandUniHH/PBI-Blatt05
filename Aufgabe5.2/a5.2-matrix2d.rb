#!/usr/bin/env ruby

# Bocher Diedrich Sandmeier

class Matrix2D

  def initialize(m, n)
    @matrix = []
    @rows = m
    @columns = n
    if @rows < 1 || @columns < 1
      raise(ArgumentError, "Ungültige Koordinatenangabe!")
    end

    @matrix = Array.new(@rows+1) {Array.new(@columns+1)}

  end

  def set_value!(row, column, value)
    if row > @rows || column > @columns
      raise(ArgumentError, "Ungültige Koordinatenangabe!")
    else
      @matrix[row][column] = value
    end

  end

  def get_value(row,column)
    if row > @rows || column > @columns
      raise(ArgumentError, "Ungültige Koordinatenangabe!")
    end
      return @matrix[row][column]
  end

  def get_number_of_rows()
    return @rows
  end

  def get_number_of_columns()
    return @columns
  end

  def pretty_print()
    1.upto(@rows) {|row|
      1.upto(@columns) {|column|
        print "#{@matrix[row][column]}"
        (column < @columns) ? (print ',') : puts
      }
    }
  end

end

############

# m = 4
# n = 5

matrix = Matrix2D.new(m,n)
matrix.pretty_print

