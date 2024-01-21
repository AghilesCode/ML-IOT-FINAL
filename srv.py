from concurrent import futures
import grpc
import file_pb2
import file_pb2_grpc
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import io

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
        for chunk in request_iterator:
            # Traitez chaque morceau d'image ici (par exemple, affichez-le ou enregistrez-le)
            image_data = chunk.data
            image_array = bytearray(image_data)

            # Utilisez Matplotlib pour afficher l'image
            image = mpimg.imread(io.BytesIO(image_array), format='JPG')
            plt.imshow(image)
            plt.show()

        # Vous pouvez renvoyer une réponse indiquant le succès de l'opération
        return streaming_pb2.UploadStatus(success=True)

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    file_pb2_grpc.add_MonServiceServicer_to_server(MonServiceServicer(), server)
    
    # Modifiez cette ligne pour écouter sur toutes les interfaces réseau
    server.add_insecure_port("[::]:50051")

    server.start()
    print("Serveur gRPC distant démarré. En attente de connexions...")
    server.wait_for_termination()

if __name__ == "__main__":
    serve()
