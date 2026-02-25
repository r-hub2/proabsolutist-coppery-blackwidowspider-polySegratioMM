;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "polySegratioMM-overview"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("mathpazo" "sc") ("fancyhdr" "") ("natbib" "round") ("graphicx" "") ("url" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "fancyhdr"
    "natbib"
    "graphicx"
    "url")
   (TeX-add-symbols
    '("sectionmark" 1))
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
   (LaTeX-add-bibliographies))
 :latex)

