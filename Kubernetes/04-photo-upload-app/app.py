import streamlit as st
import os
from PIL import Image

st.set_page_config(page_title="Simple Photo Gallery", layout="wide")

PHOTOS_DIR = "photos"

# Create directory if not exists  
os.makedirs(PHOTOS_DIR, exist_ok=True)

st.title("📸 Simple Photo Gallery")

# Upload photos
uploaded_files = st.file_uploader(
    "Upload Photos", 
    type=["jpg", "jpeg", "png"], 
    accept_multiple_files=True
)

if uploaded_files:
    for file in uploaded_files:
        file_path = os.path.join(PHOTOS_DIR, file.name)
        with open(file_path, "wb") as f:
            f.write(file.getbuffer())
    st.success("Photos uploaded successfully!")

# Display photos in grid
st.subheader("Gallery")

images = [f for f in os.listdir(PHOTOS_DIR) if f.lower().endswith((".jpg", ".jpeg", ".png"))]

cols = st.columns(4)

for idx, img_name in enumerate(images):
    img_path = os.path.join(PHOTOS_DIR, img_name)
    img = Image.open(img_path)
    cols[idx % 4].image(img, use_column_width=True)
