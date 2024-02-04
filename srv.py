from concurrent import futures
import grpc
import file_pb2
import file_pb2_grpc
from PIL import Image
from io import BytesIO

class MonServiceServicer(file_pb2_grpc.MonServiceServicer):
    def DireBonjour(self, request, context):
        return file_pb2.ReponseBonjour(message=f"Bonjour, {request.nom}!")

    def RecupererCoordonnees(self, request, context):
        x = request.x
        y = request.y
        z = request.z

        print(f"Coordonnées reçues : x={x}, y={y}, z={z}")

        # Vous pouvez effectuer d'autres opérations avec ces coordonnées si nécessaire

        # Renvoyer un message de remerciement dans la réponse
        return file_pb2.ReponseCoordonnees(message="Merci pour les coordonnées!")

    def StreamAudio(self, request_iterator, context):
            chunk_size = 1024
            sample_format = pyaudio.paInt16
            channels = 1
            fs = 44100

            p = pyaudio.PyAudio()

            stream = p.open(format=sample_format,
                            channels=channels,
                            rate=fs,
                            frames_per_buffer=chunk_size,
                            input=True)

            print("Enregistrement audio en cours...")

            try:
                while True:
                    data = stream.read(chunk_size, exception_on_overflow=False)
                    yield monprojetgrpc_pb2.AudioChunk(data=data)
            except KeyboardInterrupt:
                print("Enregistrement audio terminé.")

            stream.stop_stream()
            stream.close()
            p.terminate()


def serve():
    MAX_MESSAGE_LENGTH = 100 * 1024 * 1024
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10), options = [
        ('grpc.max_send_message_length', MAX_MESSAGE_LENGTH),
        ('grpc.max_receive_message_length', MAX_MESSAGE_LENGTH),
    ])
    file_pb2_grpc.add_MonServiceServicer_to_server(MonServiceServicer(), server)
    
    # Modifiez cette ligne pour écouter sur toutes les interfaces réseau
    server.add_insecure_port("[::]:50051")

    server.start()
    print("Serveur gRPC distant démarré. En attente de connexions...")
    server.wait_for_termination()

if __name__ == "__main__":
    serve()
