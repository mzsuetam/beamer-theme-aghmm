CSL := "csl/acm-sig-proceedings-long-author-list.csl"
HIGHLIGHT_STYLE := "highlight-styles/pygments-bg.theme"
BIB := "bibliography.bib"

pdf src="src" out="slides-latest" outdir="out" bib=BIB csl=CSL highlight_style=HIGHLIGHT_STYLE:
    pandoc -t beamer {{src}}/*.md \
    -o {{outdir}}/{{out}}.pdf \
    -F pandoc-crossref \
    -L filters/lang-filter.lua \
    --resource-path {{src}} \
    --slide-level=2 \
    --citeproc \
    --bibliography={{src}}/{{bib}} \
    --csl={{csl}} \
    --highlight-style={{highlight_style}}

TEXMFHOME := `kpsewhich -var-value=TEXMFHOME`

install-aghmd:
    @echo "Copying AGHMD theme to {{TEXMFHOME}}/tex/latex/beamer/ directory..."
    @mkdir -p {{TEXMFHOME}}/tex/latex/beamer/
    @cp -r AGHMD {{TEXMFHOME}}/tex/latex/beamer/
    mktexlsr {{TEXMFHOME}}
    @echo "Done!"
