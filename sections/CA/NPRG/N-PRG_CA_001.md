---
# seminararbeit im Seminar: Neuropragmatik, WS22/23 FUB
# Abgabe: 2022-11-20
title: "N-PRG conversation analysis"
subtitle: "Neuropragmatik WS22/23 FUB (Pulvermüller)"
author: "St. Schwarz"
date: "2022-11-22"
zotero: AVL_dyn
output: 
  html_document: 
    toc: yes
    toc_float:
      collapsed: no
      smooth_scroll: no
    self_contained: no
    code_download: no
    css: "https://ada-sub.rotefadenbuecher.de/skool/public/essais/PRG01/style_HA.css"
    keep_md: yes
#bibliography: https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/sections/DD/klemm_HA/top/klemm.bib
   # css: https://ada-sub.rotefadenbuecher.de/skool/public/papers/011/style_HA.css
#bibliography: "https://api.zotero.org/groups/4713246/collections/YTVL6QLM/items/top?format=bibtex"
bibliography: PRG_CA.bib
---



---
bibliography: "/var/folders/y3/_0j6ntls0p3b4bmwng47r4dm0000gn/T//RtmphLxSIl/ref64f5f850d3e.bib"
---



## 1. head
the conversation is part of a 15 minutes planungsgespräch. the preliminary discussion revealed that one class intended to visit commune in the future (anschluszseminar) could be one in the section :german as foreign language: (DAF) that both participants considered relevant to their curriculum and in continuation of this classes (NPRG) program.

## 2. the transcript
the dialogue represents minutes 08:42 - 10:45 of the recording transcribed according to GAT2 conventions using EXMARALDA partitur editor [[@worner_exmaralda_2014]](https://exmaralda.org/de/) and ELAN [[@elan_elan_2022]](https://archive.mpi.nl/tla/elan).

#### 2.1 basic
``` {=html}

<iframe src="prime/CA_schnipsel_001.2.txt" style="border:2px solid black;" width="100%" height="400px"></iframe>
```

#### 2.2 analysis
``` {=html}

<iframe src="prime/CA_schnipsel_001.2.html" style="border:2px solid black;" width="100%" height="400px"></iframe>
```

## 3. some visualisations & statistics
### 3.1 TRP
Auswertung 1. der TRP (transition relevant places) im Dialogverlauf. Diese werden hier 2. nach Fourier-Transformation der Positionen abgebildet, so dasz die frequenzanalysierte (nach Fourier also relative Länge) der zwischen den TRP liegenden Dialogabschnitten sichtbar ist. 3. Die relativierte Verlaufkurve der Intonationsphrasenlänge; `rot = SP0, grün = SP1, blau = Differenzkurve`.

![](N-PRG_CA_001_files/figure-html/unnamed-chunk-3-1.png)<!-- -->![](N-PRG_CA_001_files/figure-html/unnamed-chunk-3-2.png)<!-- -->![](N-PRG_CA_001_files/figure-html/unnamed-chunk-3-3.png)<!-- -->

Fourier transformation of data cf. "syuzhet" R-Package: [[@jockers_revealing_2015]](https://www.matthewjockers.net/2015/02/02/syuzhet/)

### 3.2 some numbers

```
##     speechacts speech time (sec)  words
## SP0         70                 80   167
## SP1         43                 51    71
```
---
## A. notes
## B. REF:
<div id="refs"></div>

## C. annex
transcript files, tables & source code:


```{=html}
<p>download <a href="annex.zip">annex.zip</a></p>
```

```{=html}
<!--			<p id="zt_content">temp</p>

<script>  
//function import_zt(block_id,api){
    var xhttp = new XMLHttpRequest();
      xhttp.open("GET", 'https://api.zotero.org/groups/4713246/collections/YTVL6QLM/items/top?format=bib&linkwrap=1', false);
      xhttp.send();
      document.getElementById("zt_content").innerHTML = xhttp.responseText;
    //  document.getElementById("show_button").style.display="none";
      //document.getElementById("hide_button").style.display="inline";
  //  }
</script>
-->
```

