lstmtraining \
--traineddata tesstutorial/perimetry/eng/eng.traineddata  \
--continue_from tesstutorial/perimetry_from_full/perimetry_plus_checkpoint \
--model_output perimetry.traineddata \
--stop_training

combine_tessdata -o perimetry_plus.traineddata perimetry_plus.lstm-number-dawg perimetry_plus.lstm-punc-dawg
