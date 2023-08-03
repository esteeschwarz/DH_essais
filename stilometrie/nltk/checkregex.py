import re
with open('/Users/guhl/PRO/git/clones/forTEXT.net/Preprocessing mit NLTK/Werther_Saetze_neu1.txt', 'r', encoding='utf-8') as input:
    text = input.read()

#search:
regex="und Werther"
x = re.findall(regex, text)
kwictuple=("(.{5,20}","Werther",")(.{5,20})")
regex2="(.{5,20}Werther)(.{5,20})"
kwic2="".join(kwictuple)
kwicregex=re.findall(regex2,text)
#filtered_sentences = [s for s in sentences if len(nltk.word_tokenize(sent, 'german')) > 4]
output_str = '\n'.join(x)
#output_kwic= '\n'.join(kwicregex)

with open('regexout.txt', 'w', encoding='utf-8') as output:
    output.write(output_str)