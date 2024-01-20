## principle of accountability [^1]
roughly: the number of occurences of one (coded nonstandard) feature over the number of total instances of the feature (including standard + nonstandard realisations). e.g.:

| token  | instances | standard       | nonstandard                | normalised                 |
| ------ | --------- | -------------- | -------------------------- | -------------------------- |
| schnee | 54        | 33             | 21                         | 38.8888889                 |
|        |           |                |                            |                            |
|        | all       | coded "FALSCH" | coded "1" (feature = TRUE) | percent (D2/B2\\\\\\\*100) |

workflow:

![filter out #INT speaker][image-1]

![filter after token schnee][image-2]

![analyse turn (manually)][image-3]

![set evaluation column to 1=TRUE if nonstandard occurence (context)][image-4]

1. filter out #INT speaker
2. filter after token [schnee]
3. analyse turn and define wether standard or nonstandard feature
4. set evaluation column to 1=TRUE for nonstandard occurences
5. sum up number of total instances
6. sum up number of positives (nonstandard realisation)
7. compute number of negatives (standard)
8. compute percentage


[^1]:	Labov, William. Sociolinguistic Patterns / William Labov. 1. publ. Oxford: Blackwell, 1972. Print.

[image-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-INT.png
[image-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-schnee.png
[image-3]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-schnee2.png
[image-4]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-schnee3.png