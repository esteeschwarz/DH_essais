## columns explained
|column|explanation|example|
|:--|:---|:---|
|p_interview|transcript|GCA|
|p_speaker|speaker|#GCA|
|p_token|token|Mach|
|p_lemma_SkE|sketch engine lemma|machen-v|
|p_lemma|only the lemma|machen|
|p_turn|turn, sentence|#GCA  : 43 Mach ich die Arbeit die Schule c_NPV .|
|p_turn_preceding|the preceding turn|#INT  : 42 (  activities_after_school  ) was machst du nach der Schule  , wenn du nicht hier bist  ?|
|p_transcriptLine|transcript line of the token|43|
|m_feature_eval|empty evaluation column for your researches. you can use this as a selector for finding by turning it TRUE or FALSE|FALSCH|
|m_free_col|empty evaluation column for your researches. you can use this as a selector for finding by turning it TRUE or FALSE|0|
|t_tag_SkE|full german RFTag. the following columns seperate this tag into the single items|VIMP.Full.2.Sg|
|t_PoS_ok|selector to switch if the tag is correct|1|
|t_PoS|PartOfSpeech|VIMP|
|t_category|NA|Full|
|t_funct|NA|-|
|t_case|NA|-|
|t_pers|NA|2|
|t_num|NA|Sg|
|t_gender|NA|-|
|t_tense|NA|-|
|t_mode|NA|-|
|part_L1|participant L1|G|
|part_sex|participant sex|f|
|part_age|participant age|8|
|part_CoB|participant contry of birth|Greece|
|part_YiG|participant years in germany|0.5|
|part_YoSH|particiant years of school in heritage country|0|
|part_LPM|participant language proficiency mother|kann deutsch|
|part_LPF|participant language proficiency father|kann deutsch|
|part_LUM|participant language use mother|greek|
|part_LUF|participant language use father|greek|
|part_LUS|participant language use siblings|greek|
|part_LUFR|participant language use friends|N.A.|
|c_NSM|nonstandard semantics|0|
|c_PAU|pause|0|
|c_NPV|nonstandard possessive|1|
|c_NNS|nonstandard not specified|0|
|c_NPR|nonstandard preposition|0|
|c_NAG|nonstandard agreement|0|
|c_0MD|zero modal|0|
|c_0SU|zero subject|0|
|c_NWO|nonstandard word order|0|
|c_0OB|zero object|0|
|c_0PR|zero preposition|0|
|c_COM|comment|0|
|c_NCM|nonstandard comparison|0|
|c_0AR|zero article|0|
|c_NVP|nonstandard VP|0|
|c_0VP|zero VP|0|
|c_NGN|nonstandard gender|0|
|c_0AU|zero auxiliary|0|
|c_0CP|zero copula|0|
|c_NEX|nonstandard existential|0|
|c_NRL|nonstandard relative|0|
|c_NAR|nonstandard article|0|
|c_NMD|nonstandard modal|0|
|c_0PT|zero predicate|0|
|c_NPE|nonstandard person|0|
|c_0RF|zero reflexive|0|
|c_NIO|nonstandard i.o.|0|
|c_NPS|nonstandard person|0|
|c_0PN|zero plural/numeral|0|
|c_NPO|nonstandard pronoun|0|
|c_0RL|zero relative|0|
|c_0EX|zero existential|0|
|c_NNN|nonstandard not specified|0|
|c_NCP|nonstandard copula|0|
|c_0RP|zero reflexive pronoun|0|
|c_0PD|zero predicate|0|
|c_NVC|nonstandard vocab|0|
|c_NEA|nonstandard extra article|0|
|c_NCN|nonstandard conditional|0|
