#!/bin/bash
echo "/n ****** Finetune one of the fully-trained existing models: ***********"

##########rm -rf ~/tesstutorial/digits_from_full
mkdir -p ~/tesstutorial/perimetry_from_full

combine_tessdata -e ./tessdata_best/eng.traineddata \
  ./tesstutorial/perimetry_from_full/eng.lstm
# combine_tessdata -e ./tesstutorial/perimetry/eng/eng.traineddata \
#     ./tesstutorial/perimetry_from_full/eng.lstm
  
  lstmtraining \
  --max_image_MB 30000 \
  --model_output ./tesstutorial/perimetry_from_full/perimetry_plus \
  --traineddata ./tesstutorial/perimetry/eng/eng.traineddata \
  --continue_from ./tesstutorial/perimetry_from_full/eng.lstm \
  --old_traineddata ./tessdata_best/eng.traineddata \
  --train_listfile ./tesstutorial/perimetry/eng.training_files.txt \
  --debug_interval -1 \
  --max_iterations 5000
  
  lstmtraining \
  --stop_training \
  --traineddata ./tesstutorial/perimetry/eng/eng.traineddata \
  --continue_from ./tesstutorial/perimetry_from_full/perimetry_plus_checkpoint \
  --model_output perimetry_plus.traineddata
  
lstmeval  --model ./tessdata_best/eng.traineddata --eval_listfile ./tesstutorial/perimetry/eng.training_files.txt
  
lstmeval   --model ./tessdata_best/script/Latin.traineddata --eval_listfile ./tesstutorial/perimetry/eng.training_files.txt

lstmeval   --model ./tesstutorial/perimetry_from_full/perimetry_plus_checkpoint   --traineddata ./tesstutorial/perimetry/eng/eng.traineddata   --eval_listfile ./tesstutorial/perimetry/eng.training_files.txt

 
