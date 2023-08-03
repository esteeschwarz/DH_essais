# 12255.notes on dramanlp
#sample terminal call:
#replace $TEIDIR $OUTDIR with proper folder path. note: $[folder] will not find folder (on mac), so folder names create without $
java -cp target/assembly/drama.Main.jar de.unistuttgart.ims.drama.main.TEI2XMI --input $TEIDIR --output $OUTDIR/xmi --csvOutput $OUTDIR/csv --conllOutput $OUTDIR/conll --skipSpeakerIdentifier --corpus GERDRACOR --collectionId "gdc" --doCleanup