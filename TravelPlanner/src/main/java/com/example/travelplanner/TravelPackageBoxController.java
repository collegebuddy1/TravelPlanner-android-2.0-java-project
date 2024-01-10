package com.example.travelplanner;
import javafx.event.ActionEvent;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import com.example.travelplanner.TravelPackage;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

import java.net.URL;
import java.sql.*;

public class TravelPackageBoxController {
    @FXML
    private int packageId;
    @FXML
    private int userId;
    @FXML
    private ImageView packageImage;
    @FXML
    private Label packageName;
    @FXML
    private Label packageDescription;
    @FXML
    private Label destination;
    @FXML
    private Label duration;
    @FXML
    private Label price;
    @FXML
    private Label inclusions;
    @FXML
    private Label exclusions;
    @FXML
    private Label startDate;
    @FXML
    private Label endDate;
    @FXML
    private Label availableSeats;
    @FXML
    private Label averageRating;
    @FXML
    private Label contactEmail;
    @FXML
    private Label contactPhone;
    @FXML
    private VBox packageBox;
    @FXML
    private Label starRating;
    @FXML
    private Button removeFromCartButton;

    // Method to set the remove button's visibility
    public void setRemoveButtonVisible(boolean isVisible) {
        removeFromCartButton.setVisible(isVisible);
    }

    // Method to set the action when the remove button is clicked
    public void setRemoveButtonAction(Runnable action) {
        removeFromCartButton.setOnAction(event -> action.run());
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }
    public void setPackageData(TravelPackage travelPackage) {
        // Set data for all attributes using the provided TravelPackage object
        packageName.setText(travelPackage.getPackageName());
        destination.setText(travelPackage.getDestination());
        packageDescription.setText(travelPackage.getPackageDescription());
        duration.setText(String.valueOf(travelPackage.getDuration()));
        price.setText(String.valueOf(travelPackage.getPrice()));
        inclusions.setText(travelPackage.getInclusions());
        exclusions.setText(travelPackage.getExclusions());
        startDate.setText(travelPackage.getStartDate());
        endDate.setText(travelPackage.getEndDate());
        availableSeats.setText(String.valueOf(travelPackage.getAvailableSeats()));
        averageRating.setText(String.valueOf(travelPackage.getAverageRating()));
        starRating.setText(createStarRating(travelPackage.getAverageRating()).getText());
        contactEmail.setText(travelPackage.getContactEmail());
        contactPhone.setText(travelPackage.getContactPhone());
        String imageFileName = travelPackage.getPackageImages();
        URL imageUrl = getClass().getResource("/com/example/travelplanner/" + imageFileName);
        packageImage.setImage(new Image(imageUrl.toExternalForm()));
    }
    public Label createStarRating(double averageRating) {
        Label starRatingLabel = new Label();
        starRatingLabel.setFont(Font.font("Arial", FontWeight.BOLD, 16));
        String starText = "★"; // A star character
        String ratingText = "";

        // Calculate the number of full stars
        int fullStars = (int) averageRating;

        // Add full stars
        for (int i = 0; i < fullStars; i++) {
            ratingText += starText;
        }

        // Set the text of the Label
        starRatingLabel.setText(ratingText);
        return starRatingLabel;
    }
    private boolean isPackageInCart(int userId, int packageId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_planner", "root", "35@Nethranagar")) {
            String query = "SELECT * FROM cart WHERE user_id = ? AND package_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, packageId);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.isBeforeFirst();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    @FXML
    public void addToCart(ActionEvent event) {
        // Check if a package ID is set
        if (packageId <= 0) {
            showAlert("Error", "Invalid Package", "This package cannot be added to the cart.");
            return;
        }

        // Get the currently logged-in user's ID (replace this with your actual user ID retrieval logic)
        int userId = UserSession.getInstance().getCurrentUserId();
        int quantity = 1;
        // Check if the package is already in the cart
        if (isPackageInCart(userId, packageId)) {
            showAlert("Info", "Package Already in Cart", "This package is already in your cart.");
            return;
        }
        try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_planner", "root", "35@Nethranagar")){
            String insertQuery = "INSERT INTO cart (user_id, package_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, packageId);
            preparedStatement.setInt(3, quantity);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                showAlert("Success", "Package Added to Cart", "The package has been added to your cart.");
            } else {
                showAlert("Error", "Package Not Added", "An error occurred while adding the package to your cart.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            showAlert("Error", "Database Error", "An error occurred while accessing the database.");
        }
    }
    @FXML
    public void removeFromCart(ActionEvent event) {
        CartController cartController = (CartController) UserSession.getInstance().getCartController();
        if (cartController != null) {
            cartController.removeFromCart(packageId);
        }
    }
    private void showAlert(String title, String headerText, String contentText) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(title);
        alert.setHeaderText(headerText);
        alert.setContentText(contentText);
        alert.showAndWait();
    }
    public void onMouseEntered(MouseEvent event) {
        packageBox.setStyle("-fx-background-color: #E0E0E0; -fx-border-color: #000000; -fx-border-width: 2px; -fx-padding: 10px;");
    }

    public void onMouseExited(MouseEvent event) {
        packageBox.setStyle("-fx-background-color: #FFFFFF; -fx-border-color: #000000; -fx-border-width: 2px; -fx-padding: 10px;");
    }
}
