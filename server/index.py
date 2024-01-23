import pandas as pd
import os

# Thay đổi đường dẫn đến tệp Excel của bạn
excel_file_path = 'C:\\Users\\Nhat Vuong\\Desktop\\Book1.xlsx'

# Đọc dữ liệu từ tệp Excel
df = pd.read_excel(excel_file_path)

# Lặp qua từng dòng trong DataFrame và tạo thư mục
for index, row in df.iterrows():
    folder_name = str(row['TenThuMuc'])  # Thay 'TenThuMuc' bằng tên cột chứa tên thư mục
    folder_path = os.path.join(os.getcwd(), folder_name)

    # Kiểm tra xem thư mục đã tồn tại chưa
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
        print(f'Thư mục "{folder_name}" đã được tạo.')
    else:
        print(f'Thư mục "{folder_name}" đã tồn tại.')

print('Quá trình tạo thư mục đã hoàn tất.')
