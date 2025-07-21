import random
import pygame
from pygame import mixer

# Initialize the mixer
pygame.mixer.init()

# Define the musical elements
scale = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88]  # Example: C Major scale
duration = 3  # Duration of each note in seconds
tempo = 60  # Beats per minute (slower tempo)

# Generate a soothing melody
chord_progression = [[0, 2, 4], [1, 3, 5], [2, 4, 6], [3, 5, 0]]  # Chord progression for the melody
notes = []
for _ in range(16):  # Generate 16 notes based on the chord progression
    chord = random.choice(chord_progression)
    for note in chord:
        notes.append(scale[note])

# Calculate the total duration in seconds
total_duration_minutes = 3  # Specify the desired duration in minutes
total_duration_seconds = total_duration_minutes * 60

# Set up the mixer
pygame.mixer.init()
mixer.init()

# Create an empty WAV file for the melody
mixer.music.set_volume(0.3)
mixer.music.load('sample2.wav')

# Generate the melody by appending each note to the WAV file
for note in notes:
    frequency = note
    amplitude = 0.3  # Adjust the volume as desired
    time = int(duration * 1000)  # Convert duration to milliseconds
    pygame.mixer.Sound('sample3.mp3').play()
    pygame.time.delay(time)
    mixer.music.queue('sample3.mp3')

# Play the melody
mixer.music.play()

# Wait for the specified duration
pygame.time.wait(total_duration_seconds * 1000)

# Cleanup
mixer.quit()
