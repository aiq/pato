#!/usr/bin/env bats

@test "pushf nothing" {
   run ../bin/pato pushf
   [ "$status" -eq 1 ]
   [ "${lines[0]}" = "Error: The pushf command requires one valid path as parameter." ]
   [ "${lines[1]}" = "Example: pato pushf ~/bin" ]
}

@test "pushf" {
   run ../bin/pato -i pushf /D < abcxyz.path
   [ "$status" -eq 0 ]
   [ "$output" = "/D:/a:/b:/c:/x:/y:/z" ]
}
