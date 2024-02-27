#! kotlin

val process: Process = ProcessBuilder(/* ...command = */ "dir").inheritIO().start()
process.waitFor()