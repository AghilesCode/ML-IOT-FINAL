from concurrent import futures
import grpc
import file_pb2
import file_pb2_grpc
from PIL import Image
from io import BytesIO
import img_webcam
import img_phone
from pydub import AudioSegment 
import io
import os
import img_detect_face

class MonServiceServicer(file_pb2_grpc.MonServiceServicer):
    def __init__(self):
        self.audio_chunks = []
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
        image.save("uploaded_files/image_temp.jpg")
        return file_pb2.UploadStatus(success=True)

    def StreamAudio(self, request_iterator, context):
        print('hi')
        audio_received = False
        audio_chunks = []
        # Parcourir chaque morceau d'audio reçu depuis le client
        for chunk in request_iterator:
            audio_received = True 
            # Ajouter le morceau d'audio à la liste des chunks
            audio_chunks.append(chunk.data)
        if not audio_received:
            print("Aucune donnée audio reçue.")
            return file_pb2.UploadStatus(success=False)
        # Écrire les données audio dans un fichier audio brut (par exemple, WAV)
        audio_content = b"".join(audio_chunks)
        audio = AudioSegment.from_file("your_audio_file.wav", format="raw", sample_width=2, channels=2, frame_rate=44100)


        # Exporter le fichier audio en MP3 ou MP4
        filename = "audio_output.mp3"  # Nom de fichier pour l'enregistrement
        output_format = "mp3"  # Format de sortie (MP3 par défaut)
        audio.export(filename, format=output_format)
        print(audio_received)
        # Renvoyer un message de confirmation ou de statut au client
        return file_pb2.UploadStatus(success=True)
    def UploadFile(self, request, context):
        print('UploadFile called')

        # Extraire le contenu du fichier et le nom du fichier depuis la requête
        file_content = request.data
        filename = request.filename

        # Vérifier si le répertoire "uploaded_files" existe, sinon le créer
        if not os.path.exists("uploaded_files"):
            os.makedirs("uploaded_files")

        # Chemin complet pour sauvegarder le fichier
        file_path = os.path.join("uploaded_files", filename)

        # Écrire les données du fichier dans un fichier
        try:
            with open(file_path, "wb") as f:
                f.write(file_content)
            print(f"Fichier sauvegardé dans {file_path}")
            return file_pb2.UploadStatus(success=True)
        except Exception as e:
            print(f"Erreur lors de la sauvegarde du fichier: {e}")
            return file_pb2.UploadStatus(success=False)


from flask import Flask, request
from flask_cors import CORS, cross_origin
app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

@app.route('/start', methods=['POST'])
@cross_origin()
def start_server():
    student = request.form['student']
    print(student)
    #TODO: Validate is a valid student,etc

    print("étape de la vérication de la web cam")
    verification_result = True#img_webcam.verify_identity() # avant l'examen verifie
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
        
        
        img_detect_face.verify_identity()  # open la cam et surveille l'etudiant pendant tout l'examen
        server.wait_for_termination()
        
        return "Success", 200
    else:
        print("error")
        
        
def stop_grpc_server():
    # Code pour arrêter le serveur gRPC
    # Par exemple, si votre stub gRPC a une fonction d'arrêt, vous pouvez l'utiliser
    # Exemple : stub.stop() (c'est juste un exemple, vous devez adapter cela à votre propre code)
    MAX_MESSAGE_LENGTH = 100 * 1024 * 1024
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10), options=[
            ('grpc.max_send_message_length', MAX_MESSAGE_LENGTH),
            ('grpc.max_receive_message_length', MAX_MESSAGE_LENGTH),
        ])
    file_pb2_grpc.add_MonServiceServicer_to_server(MonServiceServicer(), server)
    server.stop(grace=None)


@app.route('/stop-server', methods=['POST'])
def stop_server():
   
    try:
        stop_grpc_server()
        return 'Le serveur gRPC est arrêté', 200
    except Exception as e:
        print(f"Erreur lors de l'arrêt du serveur gRPC: {str(e)}")
        return 'Erreur lors de l\'arrêt du serveur gRPC', 500

if __name__ == '__main__':
    app.run(debug=True)