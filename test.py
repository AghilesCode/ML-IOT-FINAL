import cv2

def detect_cameras():
    # Nombre maximum d'appareils à vérifier
    max_cameras = 10

    for i in range(max_cameras):
        # Essayer d'ouvrir chaque appareil vidéo
        cap = cv2.VideoCapture(i)
        if not cap.isOpened():
            print("")
        else:
            print(f"Camera {i}: Yes")
            cap.release()

# Appel de la fonction pour détecter les caméras
detect_cameras()
