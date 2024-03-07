#! kotlin

// https://umang91.medium.com/scripting-in-kotlin-eaf01750bbee
/*
 * Path to the file(s) to be imported.
 * You can import multiple files like
 * @file:Import("<file1>", "<file2>", "<file3>")
 */
@file:Import("/KotlinScript/common-utils.main.kts")

executeOnCommandShell("dir")
