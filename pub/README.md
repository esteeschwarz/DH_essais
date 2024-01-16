# term paper draft

topic \#6, polysemous verbs with light and concrete senses, replication
study of [Mehl (2021)](https://doi.org/10.1515/cllt-2017-0039), further
used: [Gilquin
(2008)](https://dial.uclouvain.be/pr/boreal/object/boreal:75833) -
snc:01,02,3,c1,htm1,manedit.md

## init

“If onomasiological frequency measurements do indeed correlate with
elicitation tests, potential impact would be immense. Researchers would
be able to examine onomasiological frequencies in spoken corpora rather
than performing elicitation tests. That possibility would facilitate
cognitive research into languages and varieties around the world,
without the necessity of in situ psycholinguistic testing, and would
also encourage the creation of more spoken corpora.” ([Mehl (2021)
p.23](https://doi.org/10.1515/cllt-2017-0039))

## method

following corpus was used to determine frequencies:

Q.1: Santa Barbara corpus of spoken American English, ([UCSB et al.
(2005)](https://www.linguistics.ucsb.edu/research/santa-barbara-corpus))

the corpus data was downloaded from:
<https://www.linguistics.ucsb.edu/sites/secure.lsit.ucsb.edu.ling.d7/files/sitefiles/research/SBC/SBCorpus.zip>

### corpus sample

<table>
<colgroup>
<col style="width: 6%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 63%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">scb</th>
<th style="text-align: right;">id</th>
<th style="text-align: left;">text</th>
<th style="text-align: right;">lfd</th>
<th style="text-align: right;">light</th>
<th style="text-align: left;">alt</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">61913</td>
<td style="text-align: right;">53</td>
<td style="text-align: right;">604</td>
<td style="text-align: left;">and make the payroll,</td>
<td style="text-align: right;">61913</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">make</td>
</tr>
<tr class="even">
<td style="text-align: left;">57521</td>
<td style="text-align: right;">50</td>
<td style="text-align: right;">459</td>
<td style="text-align: left;">you can make some serious .. @ din 5go
working dinner @ 5 .</td>
<td style="text-align: right;">57521</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">make</td>
</tr>
<tr class="odd">
<td style="text-align: left;">44860</td>
<td style="text-align: right;">38</td>
<td style="text-align: right;">580</td>
<td style="text-align: left;">H and the new building is a new visitors
center.</td>
<td style="text-align: right;">44860</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">build</td>
</tr>
<tr class="even">
<td style="text-align: left;">17675</td>
<td style="text-align: right;">14</td>
<td style="text-align: right;">1151</td>
<td style="text-align: left;">H and he was going to .. to tell him,</td>
<td style="text-align: right;">17675</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">a-other</td>
</tr>
<tr class="odd">
<td style="text-align: left;">16921</td>
<td style="text-align: right;">14</td>
<td style="text-align: right;">397</td>
<td style="text-align: left;">TSK H The building is –</td>
<td style="text-align: right;">16921</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">build</td>
</tr>
<tr class="even">
<td style="text-align: left;">47424</td>
<td style="text-align: right;">41</td>
<td style="text-align: right;">539</td>
<td style="text-align: left;">hunh?</td>
<td style="text-align: right;">47424</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">a-other</td>
</tr>
<tr class="odd">
<td style="text-align: left;">22225</td>
<td style="text-align: right;">17</td>
<td style="text-align: right;">1011</td>
<td style="text-align: left;">H … Chaos X I guess X is basically
analysis of noise.</td>
<td style="text-align: right;">22225</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">a-other</td>
</tr>
</tbody>
</table>

### script used:

[14015.concrete-abstract\_HA.R](https://github.com/esteeschwarz/SPUND-LX/blob/main/corpusLX/14015-HA/14015.concrete-abstract_HA.R)

### process:

#### distribution analysis

cf. (Mehl 2021, 11–14)

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">ICE.written</th>
<th style="text-align: right;">ICE.spoken</th>
<th style="text-align: right;">SBC.spoken</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">concrete</td>
<td style="text-align: right;">68</td>
<td style="text-align: right;">96</td>
<td style="text-align: right;">89</td>
</tr>
<tr class="even">
<td style="text-align: left;">light</td>
<td style="text-align: right;">321</td>
<td style="text-align: right;">353</td>
<td style="text-align: right;">381</td>
</tr>
</tbody>
</table>

<figure>
<img src="README_files/figure-markdown_strict/fig-01-dist-1.png"
alt="distribution of lemma /make/ over corpora. ICE data from study." />
<figcaption aria-hidden="true">distribution of lemma /make/ over
corpora. ICE data from study.</figcaption>
</figure>

#### semantic alternatives to make

this contrast includes made up alternatives to /make/ that Mehl defined
in his study. we do not account for the context of these alternatives in
the corpus texts, i.e. all occurences are counted. Mehl contrasted only
these alternate occurences which “are defined as those verbs that occur
in the corpus with the same concrete direct objects as make, (take, and
give,) and with a roughly equivalent meaning.” Mehl puts these under
“onomasiological alternates”. (cf. Mehl (2021) p.13)

<table>
<caption>semantic alternatives</caption>
<thead>
<tr class="header">
<th style="text-align: left;">Var1</th>
<th style="text-align: right;">Freq</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">build</td>
<td style="text-align: right;">101</td>
</tr>
<tr class="even">
<td style="text-align: left;">construct</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">create</td>
<td style="text-align: right;">23</td>
</tr>
<tr class="even">
<td style="text-align: left;">generate</td>
<td style="text-align: right;">4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">make</td>
<td style="text-align: right;">89</td>
</tr>
<tr class="even">
<td style="text-align: left;">produce</td>
<td style="text-align: right;">5</td>
</tr>
</tbody>
</table>

semantic alternatives

<figure>
<img src="README_files/figure-markdown_strict/fig-02-alt-1.png"
alt="proportion of semantic alternatives to concrete /make/ in SBC" />
<figcaption aria-hidden="true">proportion of semantic alternatives to
concrete /make/ in SBC</figcaption>
</figure>

<figure>
<img src="README_files/figure-markdown_strict/fig-03-alt-1.png"
alt="proportion of semantic alternatives, only equivalent meaning of alternates" />
<figcaption aria-hidden="true">proportion of semantic alternatives, only
equivalent meaning of alternates</figcaption>
</figure>

------------------------------------------------------------------------

# B: references

Gilquin, Gaëtanelle. 2008. “What You Think Ain’t What You Get: Highly
Polysemous Verbs in Mind and Language.”
<https://dial.uclouvain.be/pr/boreal/object/boreal:75833>.

Mehl, Seth. 2021. “What We Talk about When We Talk about Corpus
Frequency: The Example of Polysemous Verbs with Light and Concrete
Senses.” *Corpus Linguistics and Linguistic Theory* 17 (1): 223–47.
<https://doi.org/10.1515/cllt-2017-0039>.

UCSB, John W. DuBois, L. Chafe Wallace, Charles Meyer, Sandra A.
Thompson, Robert Englebretson, and Nii Martey. 2005. “Santa Barbara
Corpus of Spoken American English Department of Linguistics - UC Santa
Barbara.” *SBC*.
<https://www.linguistics.ucsb.edu/research/santa-barbara-corpus>.
