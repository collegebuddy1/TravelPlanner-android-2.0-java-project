package com.example.travelplanner;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import java.net.URL;
import java.util.ResourceBundle;


public class TripPlanningController implements Initializable {

    @FXML
    private TextField searchBar;

    @FXML
    private WebView mapView;

    @FXML
    private WebView weatherReport;
    @FXML
    private Button backButton;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Initialize the web view for displaying maps
        WebEngine webEngine = mapView.getEngine();
        WebEngine webEngine1 = weatherReport.getEngine();
        // Add a listener to the search bar to load the map when the user presses Enter
        searchBar.setOnAction(event -> {
            String destination = searchBar.getText();
            loadMap(destination, webEngine);
            loadWeather(destination, webEngine1);
        });
    }

    @FXML
    private void goBackToDashboard(ActionEvent event) {
        DBUtils.changeScene(event, "Dashboard.fxml", "Dashboard", null);
    }

    private void loadMap(String location, WebEngine webEngine) {
        String mapUrl = "https://www.google.com/maps?q=" + location;
        webEngine.load(mapUrl);
    }

    private void loadWeather(String location, WebEngine webEngine){
        String weatherURL="https://www.google.com/search?q=weather+" + location;
        webEngine.load(weatherURL);
    }

}
