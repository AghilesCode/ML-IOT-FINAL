import grpc
import file_pb2
import file_pb2_grpc
from pydub import AudioSegment
import numpy as np

def generate_test_audio(output_file):
    # Créer un signal audio simple (par exemple, un sinus à 440 Hz pendant une seconde)
    duration_seconds = 1
    sample_rate = 44100  # Fréquence d'échantillonnage (en Hz)
    frequency = 440  # Fréquence du sinus (en Hz)
    amplitude = 0.5  # Amplitude du signal (entre -1 et 1)

    t = np.linspace(0, duration_seconds, int(duration_seconds * sample_rate), endpoint=False)
    signal = amplitude * np.sin(2 * np.pi * frequency * t)

    # Convertir le signal en objet AudioSegment
    audio_segment = AudioSegment(signal.tobytes(), frame_rate=sample_rate, sample_width=2, channels=1)

    # Enregistrer l'objet AudioSegment dans un fichier WAV
    audio_segment.export(output_file, format="wav")

    print(f"Audio file '{output_file}' created successfully.")

def run():
    # Créer un canal de communication gRPC avec le serveur
    channel = grpc.insecure_channel('localhost:50051')

    # Créer un client pour le service gRPC
    client = file_pb2_grpc.MonServiceStub(channel)

    # Générer un fichier audio de test
    output_file = "test_audio.wav"
    generate_test_audio(output_file)

    # Lire le fichier audio
    with open(output_file, "rb") as f:
        audio_data = f.read()

    # Envoyer le fichier audio au serveur
    request = file_pb2.AudioChunk(data=audio_data)
    response = client.StreamAudio(iter([request]))

    if response:
        print("Audio file streamed successfully.")
    else:
        print("Error streaming audio file.")

if __name__ == '__main__':
    run()
