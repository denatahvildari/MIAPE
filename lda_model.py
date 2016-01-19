import logging
import os
import gensim
from gensim import corpora, models, similarities

# MODELS_DIR: The directory you saved the bow of corpus
MODELS_DIR = "/Users/admin/Desktop/Projects/Minister-Debate Correlation/data_10year_nouns/models"

# NUM_TOPICS: number of topics you want to extract from the corpus
NUM_TOPICS = 100

# we want to log the process
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s',
                    level=logging.INFO)

# load the saved dictionary
dictionary = gensim.corpora.Dictionary.load(os.path.join(MODELS_DIR,
                                                         "mtsamples.dict"))
# load the transfered corpus
corpus = gensim.corpora.MmCorpus(os.path.join(MODELS_DIR, "mtsamples.mm"))

# transfer the tf vector to tf-idf vector
#tfidf = models.TfidfModel(corpus)

# store the transfered corpus in corpus_tfidf
#corpus_tfidf = tfidf[corpus]


# Project to LDA space
# Run lda
lda = gensim.models.LdaModel(corpus, id2word=dictionary, num_topics=NUM_TOPICS, iterations=1000, passes=500, alpha = 'auto')

# print the top words in each topic
lda.print_topics(NUM_TOPICS)

# save the model
lda.save("/Users/admin/Desktop/Projects/Minister-Debate Correlation/data_10year_nouns/models-100/lda.model")
logfile = open("/Users/admin/Desktop/Projects/Minister-Debate Correlation/data_10year_nouns/models-100/topics.txt", "a")
print>>logfile, lda.print_topics(NUM_TOPICS, 20)


