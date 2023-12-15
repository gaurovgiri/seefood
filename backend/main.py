from fastapi import FastAPI, UploadFile
from PIL import Image
from backend.model import recognize

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.post("/recognize/")
async def create_upload_file(file: UploadFile):
    if file.filename.endswith(".jpg") or file.filename.endswith(".png"):
        img = Image.open(file.file)
        print("working")
        recognized_food = recognize(img)
        return {"food": recognized_food}
    return {"error": "File not supported"}