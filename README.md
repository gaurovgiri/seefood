# SeeFood
Welcome to SeeFood, a computer vision-based application designed to recognize Nepali foods and provide detail informations such as allergens.


## Directories

### app/
This directory contains the flutter code to build the mobile application.

In order to build the mobile:

1. Goto `app/lib/core/api.dart` and change the `url` to the hosted server address.
2. Navigate to the app/ directory
3. Run the flutter
```bash
flutter run
```
4. Select the device you want you build the app.

*Note: To build the app in mobile, turn on the usb-debugger from developer settings*

### backend/
This directory contains the backend code. The backend uses fastapi to host the model and is responsible for handling the requests.

In order to run the backend:

1. Install the requirements from `requirements.txt`

```bash
pip install -r requirements.txt
```
2. Start the fastapi service
```bash
uvicorn backend.main:app --host 0.0.0.0 --port 8000
```

The backend API can be tested through <a>http://localhost:8000/docs/</a>.

*Note: Make sure the model/model.pth exists*

### model/
This directory contains the code for building the model. Pytorch is used for building the model.

**model.ipynb**: Notebook file that contains the code to build the model. <br>
**model.pth**: Saved model file. <br>
**model.py**: The inference script that runs the saved model and provides service to the backend.

## Resources

The dataset used for the training the model is: [Nepali Food Images](https://www.kaggle.com/datasets/saurabkunwar/nepali-food-images)

Feel free to explore each directory to gain a comprehensive understanding of the SeeFood project, from the user interface to the backend infrastructure and the underlying machine learning model. If you have any questions or suggestions, we welcome your contributions and feedback to enhance the SeeFood experience.
