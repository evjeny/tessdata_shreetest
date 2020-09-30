../tess4training/tesseract/src/training/tesstrain.sh \
  --fonts_dir /usr/share/fonts \
  --lang eng --linedata_only \
  --noextract_font_properties \
  --langdata_dir ./langdata \
  --tessdata_dir ./tessdata_best \
  --training_text ./eng.perimetry.training_text \
  --workspace_dir ./tmp \
  --output_dir ./tesstutorial/perimetry \
   --fontlist  \
    "Arial Bold" \
    "Arial" \
    "Courier New Bold" \
    "Courier New" \
    "Times New Roman, Bold" \
    "Times New Roman," \
    "Georgia Bold" \
    "Georgia" \
    "Trebuchet MS Bold" \
    "Trebuchet MS" \
    "Verdana Bold" \
    "Verdana" \
	"FreeSerif" \
	"FreeMono" \
	"FreeSans"

rm -rf ./tesstutorial/digits_from_full
