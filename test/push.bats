#!/usr/bin/env bats

@test "push nothing" {
   run ../bin/pato -i push < abcxyz.path
   [ "$status" -eq 1 ]
   [ "${lines[0]}" = "Error: The push command requires one valid path as parameter." ]
   [ "${lines[1]}" = "Example: pato push ~/bin" ]
}

@test "push" {
   run ../bin/pato -i push /D < abcxyz.path
   [ "$status" -eq 0 ]
   [ "$output" = "/a:/b:/c:/x:/y:/z:/D" ]
}
