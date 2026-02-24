(TeX-add-style-hook "polySegratioMM-overview"
 (lambda ()
    (LaTeX-add-bibliographies)
    (LaTeX-add-labels
     "sec:sim-data"
     "fig:sim1"
     "fig:sim2"
     "sec:mix-model"
     "eq:ripol1"
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

