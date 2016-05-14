# -*- coding: utf-8 -*-

from Liwc import LiwcReader
from OpinionLexicon import OpLexiconReader
from SentiLex import SentiLexReader
from LexiconClassifier import Classifier
from nltk.metrics import ConfusionMatrix, precision, recall, f_measure, accuracy

import nltk

import sys

import csv


reload(sys)
sys.setdefaultencoding("utf8")

# Default Variables
DEFAULT_TOKENIZE_PATTERN = r'''(?x)    # Allow verbose regexps
    (@[\w\d_]+)
    |\#[\w\d_]+
    | https?://[\w\d\.-/:\?#\[\]@!\$&'\(\)\*\+,;=]+
    | \d+(\.\d+)
    |([A-Z]\.)+        # Abbreviations, e.g. U.S.A.
    |\w+(['-]\w+)*
    | \w+(-\w+)*        # Words with optional internal hyphens
    | \.\.\.            
    | [][.,%$;"'?!:-_`]  # these are separate tokens; includes ], 
    '''

variable_names_output = [["Message", "Liwc", "OpLexicon", "SentiLex"]]

# Load Data
#sentence_vector = [["Eu", "#amo", "a", "UFPA"], ["#odeio", "esse", "lixo"]]
#sentence_vector = [["Ela e muito boa!!"], ["odeio esse lixo"]]
sentence_vector = [unicode(line.strip()) for line in open('input_data.txt', 'rt')]

# Tokenize Data
sentence_tokens_vector = []

for sentence in sentence_vector:
	tokens = nltk.regexp_tokenize(sentence, DEFAULT_TOKENIZE_PATTERN)
	sentence_tokens_vector.append(tokens)

#sys.exit()

# Load Dictionaries
liwc_dict = LiwcReader('Dictionaries/LIWC/LIWC2007_Portugues_win.dic')
oplexicon_dict = OpLexiconReader('Dictionaries/oplexicon/lexico_v2.1.txt')
sentilex_dict =  SentiLexReader('Dictionaries/SentiLex/SentiLex-flex-PT02.txt')

# Start up Classifiers
classifier_liwc = Classifier(liwc_dict)
classifier_oplexicon = Classifier(oplexicon_dict)
classifier_sentilex = Classifier(sentilex_dict)

# Collect Results
output_results = []
with open('classification_results.csv', 'w') as fp:
	csv_writer = csv.writer(fp, delimiter=',')
	csv_writer.writerows(variable_names_output)

for tokens, sentence in zip(sentence_tokens_vector, sentence_vector):
	output_results.append( [sentence, classifier_liwc.classify(tokens), classifier_oplexicon.classify(tokens), classifier_sentilex.classify(tokens)] )

#results = [classifier_liwc.classify(s) for s in sentence_tokens_vector]


with open('classification_results.csv', 'a') as fp:
	csv_writer = csv.writer(fp, delimiter=',')
	csv_writer.writerows(output_results)

print 'DONE'