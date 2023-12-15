import pickle
import torch
from torch import nn
import torch.nn.functional as F
from torchvision import transforms
from PIL import Image

class CNNModel(nn.Module):
    def __init__(self, num_classes):
        """
        This function initializes the layers for the CNN model
        """
        super(CNNModel, self).__init__()

        # parameters for conv layers
        filter_dim = 3
        in_channels = [3, 16, 32, 32]
        out_channels = [16, 32, 32, 64]

        # parameters for dense layers
        dense_in_features = [32*32*64, 32*64, 256]
        dense_out_features = [32*64, 256, num_classes]

        # initializing all the layers
        self.c1 = nn.Conv2d(in_channels[0], out_channels[0], filter_dim, padding='same')
        self.c2 = nn.Conv2d(in_channels[1], out_channels[1], filter_dim, padding='same')
        self.m1 = nn.MaxPool2d(2)
        self.dropout = nn.Dropout(p=0.25)
        self.c3 = nn.Conv2d(in_channels[2], out_channels[2], filter_dim, padding='same')
        self.c4 = nn.Conv2d(in_channels[3], out_channels[3], filter_dim, padding='same')
        self.m2 = nn.MaxPool2d(2)
        self.d1 = nn.Linear(dense_in_features[0], dense_out_features[0])
        self.d2 = nn.Linear(dense_in_features[1], dense_out_features[1])
        self.d3 = nn.Linear(dense_in_features[2], dense_out_features[2])
        
    def forward(self, x):
        """
        This function performs convolutions, relu, max_pooling, dropout, 
        reshape and dense operations on the input to the model.

        Parameters
        ------------
        x : tensor, float32
        Input image to the model

        Returns
        ------------
        x : tensor, float32
        output from the last layer

        """
        x = F.relu(self.c1(x))
        x = F.relu(self.c2(x))
        x = self.m1(x)
        x = self.dropout(x)
        x = F.relu(self.c3(x))
        x = F.relu(self.c4(x))
        x = self.m2(x)
        x = self.dropout(x)
        x = x.view(-1, 32*32*64)
        x = self.d1(x)
        x = F.relu(x)
        x = self.d2(x)
        x = F.relu(x)
        x = self.d3(x)
        return x

def _predict_image(model, image):
    img_height = 128
    img_width = 128

    class_names = ['Chatamari', 'Chhoila', 'Dalbhat', 'Dhindo', 'Gundruk', 'Kheer', 'Momo', 'Sekuwa', 'Selroti']
    
    # Load and preprocess the image
    transform = transforms.Compose(
        [transforms.Resize((img_height, img_width)),
         transforms.ToTensor(),
         transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])

    image = transform(image)
    image = image.unsqueeze(0)  # Add batch dimension

    # Move the image to the GPU if available
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    image = image.to(device)

    # Make predictions
    model.eval()
    with torch.no_grad():
        predictions = model(image)

    # Convert predictions to probabilities
    probs = torch.nn.functional.softmax(predictions[0], dim=0)

    # Get the predicted class index and confidence
    predicted_class_idx = torch.argmax(probs).item()
    confidence = 100 * probs[predicted_class_idx].item()

    # Return the result
    result = {
        "predicted_class": class_names[predicted_class_idx],
        "confidence": confidence
    }
    return result

def recognize(image):
    '''
    Function to recognize the food.
    '''
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = CNNModel(num_classes=9)
    model = model.to(device)
    model.load_state_dict(torch.load("model/model.pth"))
    model.eval()
    predicted_output = _predict_image(model,image)
    return predicted_output["predicted_class"]