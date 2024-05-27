

import cv2
from deepface import DeepFace
import datetime
import os
# Récupérer l'heure actuelle


def verify_identity():

        # Chemin vers l'image de référence
        reference_img_path = '/home/aghiles/ML-IOT-PLS/ML-IOT/img/i.jpg'

        # Charger l'image de référence
        reference_img = cv2.imread(reference_img_path)

        # Initialiser le détecteur de visage
        face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

        # Initialiser la webcam
        cap = cv2.VideoCapture(0)
        i=0
        while True:
            # Lire une image de la webcam
            ret, frame = cap.read()
            if not ret:
                print("Erreur lors de la capture de l'image.")
                break
            
            # Convertir l'image en niveaux de gris
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            
            # Détecter les visages dans l'image
            faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
            if os.path.exists("uploaded_files/audio_temp.m4a") and os.path.exists("uploaded_files/image_temp.jpg"):
            # Call detecter_triche to analyze the files
                detecter_triche("uploaded_files/audio_temp.m4a", "uploaded_files/image_temp.jpg")
            # Dessiner des rectangles autour des visages détectés
            for (x, y, w, h) in faces:
                cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2)
                
                # Extraire le visage détecté
                detected_face = frame[y:y+h, x:x+w]
                
                # Comparer le visage détecté avec l'image de référence
                verification_result = DeepFace.verify(reference_img_path, detected_face, model_name='Facenet', enforce_detection=False)
                
                # Vérifier le résultat de la vérification
                heure_actuelle = datetime.datetime.now()
                if verification_result["verified"]:
                    print("Visage détecté : Identité vérifiée.", heure_actuelle)
                    i=0
                else:
                    print("Visage détecté : Vérification de l'identité échouée.", heure_actuelle)
                    i=i+1
                    if i == 10:
                        print("pissibilité de triche", heure_actuelle)
                
            
            # Afficher l'image avec les visages détectés
            cv2.imshow('Face Detection', frame)
            
            # Quitter la boucle si la touche 'q' est pressée
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

        # Libérer les ressources
        cap.release()
        cv2.destroyAllWindows()