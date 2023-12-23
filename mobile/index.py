import cv2
import numpy as np

# Đọc hình ảnh
image = cv2.imread('https://firebasestorage.googleapis.com/v0/b/spotify-83a8a.appspot.com/o/images%2Falbums%2FThe%20time%20of%20the%20oath.jpg?alt=media&token=609adc1d-906e-4063-9680-38d04a39233a')

# Chuyển đổi màu từ BGR sang RGB
image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# Reshape hình ảnh để tính toán
pixels = image_rgb.reshape((-1, 3))

# Sắp xếp pixels theo màu sắc
sorted_pixels = pixels[np.lexsort(pixels.T)]

# Lấy màu chủ đạo (ví dụ: màu có số lượng xuất hiện nhiều nhất)
dominant_color = np.bincount(sorted_pixels[:, 0]).argmax()

print(dominant_color)
