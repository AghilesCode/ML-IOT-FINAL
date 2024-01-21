import grpc
from file_pb2 import MessageBonjour, Coordonnees
from file_pb2_grpc import MonServiceStub

def run():
    # Modifiez l'adresse IP et le port pour correspondre à ceux du serveur distant
    channel = grpc.insecure_channel(":50051")
    stub = MonServiceStub(channel)

    # Appel au service DireBonjour
    response_bonjour = stub.DireBonjour(MessageBonjour(nom="Alice"))
    print(f"Réponse du service DireBonjour: {response_bonjour.message}")

    # Appel au service RecupererCoordonnees
    coordonnees = Coordonnees(x=1.0, y=2.0, z=3.0)  # Remplacez ces valeurs par celles que vous souhaitez envoyer
    response_coord = stub.RecupererCoordonnees(coordonnees)
    print(f"Réponse du service RecupererCoordonnees: {response_coord.message}")

if __name__ == "__main__":
    run()
