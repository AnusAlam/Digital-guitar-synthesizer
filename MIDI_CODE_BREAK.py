import pretty_midi

midi_data = pretty_midi.PrettyMIDI('path/to/MIDI_file.mid')


for instrument in midi_data.instruments:
    print(f"\nInstrument: {instrument.name}")
    noTes = []
    dura_tion = []
    for note in instrument.notes:
        freq = pretty_midi.note_number_to_hz(note.pitch)
        duration = f"{note.end - note.start:.2f}"
        noTes.append(f"{freq:.2f}")
        dura_tion.append(duration)


    print("Frequencies:")
    for i in range(0, len(noTes), 10):
        print(",".join(noTes[i:i+10]))
    
    # Print durations 10 per line  
    print("\nDurations:")
    for i in range(0, len(dura_tion), 10):
        print(",".join(dura_tion[i:i+10]))
