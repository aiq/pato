package = "pato"
version = "scm-0"

description = {
   summary = "command-line tool to manipulate a PATH variable",
   license = "MIT",
   homepage = "https://github.com/aiq/pato"
}

source = {
   url = "..."
}

dependencies = {
   "lua >= 5.1"
}

build = {
   type = "builtin",
   install = {
      bin = {
         [ "pato" ] = "bin/pato"
      }
   }
}
