# This program checks to see if a string with curly brackets, square braces,
# or parenthesis is properly closed.

def closed(input)
  open_stack = []
  input.chars.each do |char|
    if is_open(char)
      open_stack << char
    elsif is_close(char)
      open_char = open_stack.pop
      return false unless closes_stack(open_char, char)
    end
  end
  return open_stack.empty?
end

def is_open(char)
  char == "{" || char == "[" || char == "("
end

def is_close(char)
  char == "}" || char == "]" || char == ")"
end

def closes_stack(opener, closer)
  (opener == "{" && closer == "}") || (opener == "[" && closer == "]") || (opener == "(" && closer == ")")
end

v1 = closed("[{()}]")
puts "v1 should be true. It is #{v1}"
v2 = closed("[{)}]")
puts "v2 should be false. It is #{v2}"
v3 = closed("[{}([]{})]")
puts "v3 should be true. It is #{v3}"
v4 = closed("[{}]{")
puts "v4 should be false. It is #{v4}"
v5 = closed("hello[do the thing {,,,}](yes)")
puts "v5 should be true. It is #{v5}"
