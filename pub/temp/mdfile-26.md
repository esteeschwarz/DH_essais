## SES distribution analysis
the following is the output table of the multivariate analysis of a frequency table of all feature codes over all target childs.  
the frequency table was exported from an ANNIS installation of the SES corpus. the query for getting the proper results is:  
`codetag = /c_.*/ & int = /T.*|G.*/ & #1 . #2`
this outputs all occuring codes over the transcripts and associates them to the speaker, either T=any turkish or G=any greek. with that you get a frequency table looking like this (exerpt):

| featurecode | child | count |
| ----------- | ----- | ----- |
| NPR         | GCA   | 16    |
| COM         | TBR   | 16    |
| COM         | TAA   | 15    |
| 0AR         | TBL   | 14    |
| NPR         | TBT   | 14    |
| 0AR         | GCB   | 14    |
| COM         | TBL   | 14    |
| 0AR         | GDA   | 13    |
| COM         | TBM   | 13    |
| NNS         | TBQ   | 13    |
| 0AR         | TBS   | 13    |
| COM         | GCA   | 13    |
| NPR         | TBU   | 12    |
| NPR         | GCC   | 12    |
| 0AR         | TBT   | 12    |
| COM         | TBU   | 12    |
| 0AR         | TBU   | 11    |
| NNS         | GCB   | 11    |

visualised:
![][image-26-1]

![][image-26-2]


### small significance testing:
script source: [https://github.com/esteeschwarz/HU-LX/blob/main/scripts/distribution-analysis.R][26-1]  

the applied lmer (linear mixed effects regression model) [^26-1] formula is:  
`count ~ feature + (1 | L1)`  
in words: *we posited a main effect of feature  and random effects of L1*.
with this assumption a significance of `p < 0.05` was tested at 0AR (zero article), i.e. the coding of this feature (here) depends significant on the L1 use of the target child.   **IMPORTANT:** this does not allow general statements about the relation of 0AR feature and L1 since the transcript corpus was not coded/annotated until every instance of each feature.

### lmer coefficients

|             |          |            |     |         |                                          |     |     |
| ----------- | -------- | ---------- | --- | ------- | ---------------------------------------- | :-- | :-- |
|             | Estimate | Std. Error | df  | t value | Pr ( \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\> t) |     |     |
| feature0AR  | 5,324    | 2,778      | 333 | 1,916   | 0,056                                    |     |     |
| featureNPR  | 4,286    | 2,786      | 333 | 1,538   | 0,125                                    |     |     |
| featureNAG  | 3,353    | 2,817      | 333 | 1,19    | 0,235                                    |     |     |
| featureNNS  | 2,8      | 2,792      | 333 | 1,003   | 0,317                                    |     |     |
| feature0SU  | 2,571    | 2,777      | 333 | 0,926   | 0,355                                    |     |     |
| featureNGN  | 1,893    | 2,786      | 333 | 0,679   | 0,497                                    |     |     |
| featureNPE  | 2        | 2,957      | 333 | 0,676   | 0,499                                    |     |     |
| feature0PR  | 1,682    | 2,799      | 333 | 0,601   | 0,548                                    |     |     |
| feature0OB  | 1,261    | 2,797      | 333 | 0,451   | 0,652                                    |     |     |
| featureNSM  | 1,167    | 2,794      | 333 | 0,418   | 0,677                                    |     |     |
| featureNWO  | 1,067    | 2,828      | 333 | 0,377   | 0,706                                    |     |     |
| (Intercept) | 1        | 2,738      | 333 | 0,365   | 0,715                                    |     |     |
| feature0EX  | 1        | 3,353      | 333 | 0,298   | 0,766                                    |     |     |
| feature0MD  | 1        | 3,872      | 333 | 0,258   | 0,796                                    |     |     |
| featureNPO  | 1        | 3,872      | 333 | 0,258   | 0,796                                    |     |     |
| featureNVP  | 0,667    | 2,957      | 333 | 0,225   | 0,822                                    |     |     |
| featureNEX  | 0,6      | 2,999      | 333 | 0,2     | 0,842                                    |     |     |
| feature0RF  | 0,5      | 3,353      | 333 | 0,149   | 0,882                                    |     |     |
| featureNCM  | 0,429    | 2,927      | 333 | 0,146   | 0,884                                    |     |     |
| feature0CP  | 0,375    | 2,822      | 333 | 0,133   | 0,894                                    |     |     |
| feature0AU  | 0,333    | 2,957      | 333 | 0,113   | 0,91                                     |     |     |
| feature0VP  | 0,308    | 2,841      | 333 | 0,108   | 0,914                                    |     |     |
| featureNRL  | 0,267    | 2,828      | 333 | 0,094   | 0,925                                    |     |     |
| featureNPV  | 0,091    | 2,86       | 333 | 0,032   | 0,975                                    |     |     |
| feature0AP  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| feature0EL  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| feature0PD  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| feature0PN  | 0        | 3,061      | 333 | 0       | 1                                        |     |     |
| feature0PT  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| feature0RL  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| feature0RP  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNAR  | 0        | 2,927      | 333 | 0       | 1                                        |     |     |
| featureNAU  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNCA  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNCJ  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNCN  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNCP  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNEA  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNIO  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNMD  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNNN  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNPN  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |
| featureNPS  | 0        | 2,957      | 333 | 0       | 1                                        |     |     |
| featureNVC  | 0        | 3,872      | 333 | 0       | 1                                        |     |     |


[^26-1]:	Bates u. a., „Fitting Linear Mixed-Effects Models Using lme4“. 2015. [doi: 10.18637/jss.v067.i26-01][26-2]

[26-1]:	https://github.com/esteeschwarz/HU-LX/blob/main/scripts/distribution-analysis.R
[26-2]:	10.18637/jss.v067.i01

[image-26-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/coded%20features%20over%20corpus.png
[image-26-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/coded%20features%20over%20kids.png
