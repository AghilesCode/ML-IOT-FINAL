from concurrent import futures
import grpc
import file_pb2
import file_pb2_grpc
from PIL import Image
from io import BytesIO
import img_webcam
import img_phone
import img_detect_face

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

    def UploadImage(self, request_iterator, context):
        image_data = b''
        for chunk in request_iterator:
            image_data += chunk.data
        image = Image.open(BytesIO(image_data))
        image.show()
        return file_pb2.UploadStatus(success=True)

    def ProcessAndSaveAudio(self, request_iterator, context, filename, output_format="mp3"):
        # Parcourir chaque morceau d'audio reçu depuis le client
        for chunk in request_iterator:
            # Ajouter le morceau d'audio à la liste des chunks
            self.audio_chunks.append(chunk.data)
        
        # Écrire les données audio dans un fichier audio brut (par exemple, WAV)
        audio_content = b"".join(self.audio_chunks)
        audio = AudioSegment.from_file(io.BytesIO(audio_content), format="raw")

        # Exporter le fichier audio en MP3 ou MP4
        audio.export(filename, format=output_format)

        # Renvoyer un message de confirmation ou de statut au client
        return monprojetgrpc_pb2.UploadStatus(success=True)


def serve():
    print("étape de la vérication de la web cam")
    verification_result = img_webcam.verify_identity #avant l'examen verifie
    print("Verification result:", verification_result)

    
    if verification_result :
        print("début de l'examen")

        MAX_MESSAGE_LENGTH = 100 * 1024 * 1024
        server = grpc.server(futures.ThreadPoolExecutor(max_workers=10), options=[
            ('grpc.max_send_message_length', MAX_MESSAGE_LENGTH),
            ('grpc.max_receive_message_length', MAX_MESSAGE_LENGTH),
        ])
        file_pb2_grpc.add_MonServiceServicer_to_server(MonServiceServicer(), server)

        # Modifiez cette ligne pour écouter sur toutes les interfaces réseau
        server.add_insecure_port("[::]:50051")
        server.start()
        print("Serveur gRPC distant démarré. En attente de connexions...")
        server.wait_for_termination()
        print(img_detect_face.verify_identity) #open la cam et surveille l'etudiant pendant tout l'examen
    else :
        print("error")

if __name__ == "__main__":
    serve()
