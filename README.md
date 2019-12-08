# Latex-THM

This is a a LaTex document class useable for the THM and StudiumPlus.

## Getting Started

### LaTex Version

Clone this repo and modify the [document.tex](./document.tex) file according to your needs. See the [release page](https://github.com/Flo9818/Latex-THM/releases) for a preview.

### Pandoc Version

If your not familiar with LaTex or simply prefer writing in markdown but you like these beautiful looking LaTex pdf's thats completly fine. Use [document.md](./document.md) as a start. If you are ready run
```bash
pandoc document.md -o document.pdf --template THM.latex --top-level-division=chapter
```
to compile your markdown to pdf.

## Lyx Version

To use Lyx as a frontend for your document, you have to complete these steps:

1. Obviously install Latex and Lyx

2. Copy `THM.latex` into `.lyx/layouts`.

   `cp THM.latex ~/.lyx/layouts`

3. Create a `textmf` directory in your current home

    `mkdir -p ~/textmf/tex/latex`

4. Copy `THM.cls` and the resource folder to `~/textmf/tex/latex`

    `cp resources ~/textmf/tex/latex`

    `cp THM.cls ~/textmf/tex/latex`

5. Update Lyx: Tools -> Reconfigure and restart Lyx

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

### Signature

If provided it will add a signature to the lock mark. Can be any image or pdf/eps file. Hint: Create your signature on a touchscreen device, export it to pdf.

```latex
\signature{yourSignatureFile}{paddingTop}{paddingLeft}
```

### Common acronyms

Adds a statement about the usage of common known acronyms.

```latex
\commonAcronyms
```

### Notes

For adding side notes the `todonotes` package is used. For convenience, there are short cuts for some different types of notes. Any arguments in `[]` will be passed to the underlying `\todo` command. 

```latex
\unsure{Is this correct?}
\change{Change this!}
\info{This can help me in chapter seven!}
\improvement{The following section needs to be rewritten!}

\unsure[inline]{An inline todo}
```