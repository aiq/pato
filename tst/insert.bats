#!/usr/bin/env bats

@test "insert with to few arguments" {
   run ../bin/pato insert
   [ "$status" -eq 1 ]
   [ "${lines[0]}" = "Error: The insert command requires a valid index and path as parameter." ]
   [ "${lines[1]}" =  "Example: pato insert 4 ~/bin" ]
}

@test "insert with a string as index" {
   run ../bin/pato insert one ~/bin
   [ "$status" -eq 1 ]
   [ "$output" = "Error: \"one\" is not a number." ]
}

@test "insert with out of range" {
   run ../bin/pato -i insert 10 ~/bin < local_usr_root.path
   [ "$status" -eq 1 ]
   [ "$output" = "Error: \"10\" is out of range[1-6]." ]
}

@test "insert" {
   run ../bin/pato -i insert 4 /E < abcxyz.path
   [ "$status" -eq 0 ]
   [ "$output" = "/a:/b:/c:/E:/x:/y:/z" ]
}
