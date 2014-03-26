memory_idx = 0
ip = 0
main_memory = Array.new(256, 0)

program = File.read("program.bf")

while ip < program.size
  cmd_char = program[ip]
  ip += 1

  case cmd_char
  when ">"
    memory_idx += 1
  when "<"
    memory_idx -= 1
  when "+"
    main_memory[memory_idx] += 1
  when "-"
    main_memory[memory_idx] -= 1
  when "."
    STDOUT.putc(main_memory[memory_idx])
  when ","
    main_memory[memory_idx] = STDIN.getc
  when "["
    if main_memory[memory_idx] == 0
      count = 0
      until (count == 0 && program[ip] == "]")
        if program[ip] == "["
          count += 1
        elsif program[ip] == "]"
          count -= 1
        end
        ip += 1
      end
      ip += 1
    end
  when "]"
    if main_memory[memory_idx] != 0
      count = 0
      ip -= 2
      until (count == 0 && program[ip] == "[")
        if program[ip] == "]"
          count += 1
        elsif program[ip] == "["
          count -= 1
        end
        ip -= 1
      end
      ip += 1
    end
  end
end
