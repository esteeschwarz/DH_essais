# 12282.notes on progress
## dynamiken postdeutscher gegenwartsliteratur
## liso, SS2022 FUB
#### 20220710(12.09)

(just a template for markdown R knit essai)
- 12282.
- .01 sample extract wordlist of klemm(1765). this shall work accompanied by a small HOW-TO with every halfways able publishing house responsible who will be formally adressed to extract these data as base of the poetry corpus to build. the tool used: <http://www.laurenceanthony.net/software/antconc/> can be used on windows and mac and platforms and easily provides e.g. a wordlist as .csv data table which is sufficient for our purpose here. people install the tool on their computer, load single texts, apply a create wordlist function export the data to a zipped table very conveniently. this all is done within 5min.
- .02 NEXT: may get institutional backup for adressing verlagsresponsibles to excercise the above. 
- .03 TODO: antconc HOW-TO extract wordlist
- 12286.
- .01 referenzkorpus: dereko > no. not really a lexikon but rather references complete language of use
- .02 duden API, <https://api.duden.io/#introduction>
- 12287.
- .01 api wks with shell script, responding writing mistakes on submitted text according to duden. words not able to be lemmatized which would be the target (multilingual & neologisms) call an empty response. essai on types in wolf/kochanie which have been extracted with antconc on ocr processed philbib scan gives first impression of the capability of the method
- .02 DUE: integrate api request in R script, process response and evaluate