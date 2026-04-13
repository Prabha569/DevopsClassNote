import streamlit as st
import os
from pathlib import Path
from PIL import Image

# Folder to store photos
PHOTO_DIR = Path("photos")
PHOTO_DIR.mkdir(exist_ok=True)

st.title("📸 Simple Photo Upload & Gallery App")

# ---- Upload Section ----
uploaded = st.file_uploader("Upload a photo", type=["jpg", "jpeg", "png"])

if uploaded:
    # Save file to /photos
    file_path = PHOTO_DIR / uploaded.name
    with open(file_path, "wb") as f:
        f.write(uploaded.getbuffer())
    st.success(f"Uploaded: {uploaded.name}")

# ---- Gallery Section ----
st.header("🖼️ Photo Gallery")

images = list(PHOTO_DIR.glob("*"))

if not images:
    st.info("No photos yet. Upload something!")
else:
    cols = st.columns(3)  # 3-column grid

    for idx, img_path in enumerate(images):
        col = cols[idx % 3]
        with col:
            img = Image.open(img_path)
            st.image(img, caption=img_path.name, use_column_width=True)
