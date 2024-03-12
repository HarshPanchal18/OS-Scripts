#! kotlin

fun executeOnCommandShell(command: String) {
    val process = ProcessBuilder("/bin/bash","-c","$command").inheritIO().start()
    process.waitFor()
}