# LaTeX Template for my PhD Thesis

Clone with submodules for the package generating the cover.

```sh
git clone --recursive git@github.com:mpizenberg/thesis-template-latex.git
```

Compile with `make`.
It will generate build artifacts in the `build/` directory.
Other targets are possible (cf Makefile), like:

- `make pdf`: just make pdf using latexmk (default).
- `make printer`: make pdf and compress suitable for printing.
- `make screen`: make pdf and compress suitable for screens.
- `make watch`: automatically recompile when file changes are saved.
- `make clean`: remove latex intermediate build artifacts.
- `make clean-all`: basically `rm -rf build/`
