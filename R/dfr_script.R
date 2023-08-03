library("dfrtopics")
m <- model_dfr_documents(
    citations_files="dfr-data/citations.tsv",
    wordcounts_dirs="dfr-data/wordcounts",
    n_topics=40
)
# optional but recommended: save model outputs
write_mallet_model(m, output_dir="model")
# create data files and copy over dfr-browser sources
export_browser_data(m, out_dir="dfr/browser", supporting_files=TRUE)