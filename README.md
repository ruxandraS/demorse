# Demorse Application

This application is able to decode a given Morse audio signal in a graphical representation, as well as in text. The application only works with audio files saved at a frequency of 550Hz, but can perform on any WPM speed.

### To Run
1. Make sure you have the octave package installed, 4.4.0 release or later.
2. Open your terminal and run ``octave``
3. `demorse(filename.wav)` takes as input the audio file sent as parameter, plays the sound, displays the original and the processed wave forms and creates a new file, named `filename.txt`.
4. `noise(filename.wav)` takes as input the audio file sent as parameter, and adds Gaussian noise and a sinusoidal, undecodable signal to it. The new audio file is saved under the `filename_noisy.wav` name. You can then proceed decoding it using the `demorse()` function.

### More Information
For more information on Morse code in general, and implementation details, make sure to check the document provided with this project.