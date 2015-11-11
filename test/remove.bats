#!/usr/bin/env bats

@test "remove with to few arguments" {
   run ../bin/pato remove
   [ "$status" -eq 1 ]
   [ "${lines[0]}" = "Error: The remove command requires one valid index parameter." ]
   [ "${lines[1]}" = "Example: pato remove 2" ]
}

@test "remove with a string argument" {
   run ../bin/pato remove four
   [ "$status" -eq 1 ]
   [ "$output" = "Error: \"four\" is not a number." ]
}

@test "remove with out of range" {
   run ../bin/pato -i remove 0 < local_usr_root.path
   [ "$status" -eq 1 ]
   [ "$output" = "Error: \"0\" is out of range[1-6]." ]
}

@test "remove" {
   run ../bin/pato -i remove 2 < abcxyz.path
   [ "$status" -eq 0 ]
   [ "$output" = "/a:/c:/x:/y:/z" ]
}
