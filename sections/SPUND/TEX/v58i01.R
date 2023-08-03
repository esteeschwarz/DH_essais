########################################################################
##  Version 1: PDF exams() from Sweave exercises
########################################################################

## single exercise
library("exams")
set.seed(1090)
exams("tstat.Rnw")

## exam with list of 5 exercises
myexam <- list(
  "boxplots",
  c("confint", "ttest", "tstat"),
  c("anova", "regression"),
  "scatterplot",
  "relfreq")
odir <- tempfile()
set.seed(1090)
exams(myexam, n = 3, dir = odir, template = c("exam", "solution"))
dir(odir)


########################################################################
## Version 2: Producing PDF, HTML, or XML for Moodle or OLAT
########################################################################

## PDF with single exercise
set.seed(1090)
exams2pdf("tstat.Rnw")

## HTML with single exercise
set.seed(1090)
exams2html("tstat.Rnw")

## Moodle XML with 3 replications of 5 exercises
set.seed(1090)
exams2moodle(myexam, n = 3, dir = odir)
dir(odir)
## -> Include in Moodle quiz:
## (1) Import resulting moodlequiz.xml into the question bank in Moodle
## (2) Add replications of each exercise as "random" questions into quiz

## IMS QTI 1.2 with 3 replications (=items) of 4 exercises (=sections)
set.seed(1090)
exams2qti12(myexam, n = 3, dir = odir)
dir(odir)
## -> Include in OLAT test:
## (1) Create a new test in OLAT
## (2) Import test configuration from .zip file


########################################################################
## Creating the first exam
########################################################################

## set up a directory with demo.R, exercises, and templates
## (you could also use dir = "C:/myexam/" or dir = "~/myexam/")
mydir <- file.path(tempdir(), "myexam")
exams_skeleton(dir = mydir, absolute = TRUE,
  writer = c("exams2html", "exams2pdf", "exams2moodle"))
dir(mydir)


########################################################################
## Design
########################################################################

## answerlist generation
qu <- c("Zurich is the capital of Switzerland.",
        "Italian is an official language in Switzerland.",
        "Switzerland is part of the European Union (EU).")
answerlist(qu)

sol <- c(FALSE, TRUE, FALSE)
ex <- c("The capital of Switzerland is Bern.",
        "The official languages are: German, French, Italian, Romansh.",
        "Switzerland is part of the Schengen Area but not the EU.")
answerlist(ifelse(sol, "True", "False"), ex)

## xexams() function
set.seed(1090)
x <- xexams(myexam, n = 3)

writeLines(x[[1]][[1]]$question)
x[[1]][[1]]$supplements

x[[1]][[1]]$questionlist
x[[1]][[1]]$metainfo[c("file", "type", "solution")]

## TeX-to-HTML tranformer generator
trafo <- make_exercise_transform_html(converter = "ttm", base64 = FALSE)
writeLines(trafo(x[[1]][[1]])$question)

## underlying TeX-to-HTML converter functions
tex <- c("This is \\textbf{bold} and this \\textit{italic}.",
  "Points on the unit circle: $x^2 + y^2 = 1$.")
ttm(tex)
tth(tex)
(tex2image(tex, dir = odir, show = FALSE))


########################################################################
## Cloze exercises
########################################################################

## boxplot and histogram exercise in QTI 1.2 for OLAT/OpenOLAT
set.seed(1090)
exams2qti12("boxhist", n = 1, name = "boxhist")

## the same exercise for Moodle
set.seed(1090)
exams2moodle("boxhist", n = 1, name = "boxhist")

## ...and using Moodle's custom layout for nicer drop-down menus
set.seed(1090)
exams2moodle("boxhist2", n = 1, name = "boxhist2")

## fourfold table exercise in default layout
set.seed(1090)
exams2moodle("fourfold", n = 1, name = "fourfold")

## ...and using Moodle's custom layout (here for an actual table)
set.seed(1090)
exams2moodle("fourfold2", n = 1, name = "fourfold2")
