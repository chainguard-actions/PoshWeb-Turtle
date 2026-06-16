# Security

We take security seriously.  If you believe you have discovered a vulnerability, please [file an issue](https://github.com/PowerShellWeb/Turtle/issues).

## Special Security Considerations

This implementation of Turtle is built with PowerShell, and can run in a GitHub action.

While the majority of the module does not allow for direct script input, declaring a new L-System involves using a custom ScriptBlock.

In theory, this could be a code injection vector.

In practice, this a simple risk to mitigate:  do not allow custom ScriptBlocks to provided as input to web forms, and watch out for the injection of dangerous L-systems declarations in any potential pull request.

If there are additional special security considerations not covered in this document, please [file an issue](https://github.com/PowerShellWeb/Turtle/issues).
