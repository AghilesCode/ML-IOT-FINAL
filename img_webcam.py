import cv2
import numpy as np
from deepface import DeepFace

def estimate_blur(image):
    """Estime le flou d'une image en calculant la variance du Laplacien."""
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    laplacian_var = cv2.Laplacian(gray, cv2.CV_64F).var()
    return laplacian_var

def verify_identity():
    """Capture plusieurs images via la webcam, sélectionne la moins floue, et vérifie l'identité avec une image de référence spécifiée."""
    # Chemins prédéfinis
    reference_img_path = '/Users/angegonzalez/Downloads/profile.HEIC'
    temp_img_path = 'path_to_save_live_capture.jpg'
    model_name = 'Facenet'

    # Initialize the camera
    cap = cv2.VideoCapture(0)  # 0 is usually the default camera

    print("Starting verification... Press 'q' to quit.")

    try:
        images = []
        blur_values = []

        # Capture multiple images for a set period
        for _ in range(5):
            ret, frame = cap.read()
            if not ret:
                print("Failed to grab frame")
                break
            blur = estimate_blur(frame)
            images.append(frame)
            blur_values.append(blur)
            cv2.imshow('Webcam', frame)
            if cv2.waitKey(1000) & 0xFF == ord('q'):  # Wait for 1 second or quit
                break

        # Select the least blurry image
        if blur_values:
            least_blurry_index = np.argmax(blur_values)
            best_frame = images[least_blurry_index]

            # Save the best frame to a file
            cv2.imwrite(temp_img_path, best_frame)

            # Perform the verification
            verification_result = DeepFace.verify(reference_img_path, temp_img_path, model_name=model_name, enforce_detection=False)
            
            # Check the verification result
            if verification_result["verified"]:
                print("Identity verified.")
                return True
            else:
                print("Verification failed.")
                return False

    except Exception as e:
        print(f"An error occurred: {e}")
        return False

    finally:
        # Release the camera and close the window
        cap.release()
        cv2.destroyAllWindows()

