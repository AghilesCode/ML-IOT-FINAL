import cv2
import numpy as np
from matplotlib import pyplot as plt

def detect_and_save_screens(image_path):
    img = cv2.imread(image_path)
    if img is None:
        print("Image non trouvée.")
        return
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    edges = cv2.Canny(blur, 50, 150)
    contours, _ = cv2.findContours(edges, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    screens_found = 0
    cropped_images = []

    for cnt in contours:
        epsilon = 0.05 * cv2.arcLength(cnt, True)
        approx = cv2.approxPolyDP(cnt, epsilon, True)
        if len(approx) == 4:
            x, y, w, h = cv2.boundingRect(approx)
            aspect_ratio = w / float(h)
            if 1.3 <= aspect_ratio <= 1.8 and cv2.contourArea(cnt) > 1000:
                screen = img[y:y+h, x:x+w]
                screens_found += 1
                screen_path = f'screen_{screens_found}.jpg'
                cv2.imwrite(screen_path, screen)
                print(f"Écran détecté et sauvegardé: {screen_path}")
                cropped_images.append(screen)

    if screens_found == 0:
        print("Pas d'écran détecté.")
    else:
        # Afficher l'image originale
        plt.figure(figsize=(10, 6))
        plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
        plt.title("Image Originale")
        plt.show()

        # Afficher les images extraites
        for i, cropped_img in enumerate(cropped_images, 1):
            plt.figure(figsize=(5, 3))
            plt.imshow(cv2.cvtColor(cropped_img, cv2.COLOR_BGR2RGB))
            plt.title(f"Écran Détecté {i}")
            plt.show()

