(TeX-add-style-hook "_region_"
 (lambda ()
    (LaTeX-add-bibliographies
     "polySegratioMM")
    (LaTeX-add-labels
     "fig:sim1"
     "fig:sim2"
     "sec:mix-model"
     "eq:logit"
     "eq-bin-mod1"
     "eq:3normals"
     "eq:mix1"
     "sec:model-spec"
     "sec:model-fit"
     "fig:trace1"
     "fig:fitted1"
     "sec:marker-dosage"
     "sec:acknowledgments")
    (TeX-run-style-hooks
     "/usr/share/R/texmf/Sweave"
     "url"
     "graphicx"
     "natbib"
     "round"
     "mathpazo"
     "sc"
     "fontenc"
     "T1"
     "fancyhdr"
     "latex2e"
     "art10"
     "article"
     "a4paper")))

