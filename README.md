# Latex-THM

This is a a LaTex document class useable for the THM and StudiumPlus.

## Getting Started

### LaTex Version

Clone this repo and modify the [document.tex](./document.tex) file according to your needs. See [here](./document.pdf) for a preview.

### Pandoc Version

If your not familiar with LaTex or simply prefer writing in markdown but you like these beautiful looking LaTex pdf's thats completly fine. Use [document.md](./document.md) as a start. If you are ready run
```bash
pandoc document.md -o document.pdf --template THM.latex --top-level-division=chapter
```
to compile your markdown to pdf.

## Custom commands

### Maketitle

Use the standard `\maketitle` command to generate your title page. All your information will be added automatically.

### Makeinsurance

Use `\makeinsurance` for generating a insurance section. All your information will be added automatically.

### DocumentType

Set the document type with:

```latex
\documentType{Praxisphasenbericht}{SS 2018}
```

As second argument a short description can be supplied. Use `{}` for empty description

### Author

The standard author command of LaTex is overriden

```latex
\author{Your Name}{Your zip code}{Your place}{Your address}{Your matnr}
```

Supply additional information like shown above. Use `{}` for empty description

### Company supervisor

Set your company supervisor with:

```latex
\companysupervisor{Name}
```

### University supervisor

Set your unversity supervisor with:

```latex
unisupervisor{Name}
```

### Company

Set company information.

```latex
\company{Company name}{company zip code}{company place}{company address}{logo.png}
```

### Lock mark

Adds a generic lock mark to your document.

```latex
\lockMark
```

### Common acronyms

Adds a statement about the usage of common known acronyms.

```latex
\commonAcronyms
```