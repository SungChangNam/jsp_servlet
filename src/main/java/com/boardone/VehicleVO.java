package com.boardone;

import java.io.Serializable;

public class VehicleVO implements Serializable {
    private int vehicleId;
    private String model;
    private String availability;
    private double pricePerDay;
    private String imageUrl;

    // 생성자, getter 및 setter
    public VehicleVO() {}

    public VehicleVO(int vehicleId, String model, String availability, double pricePerDay, String imageUrl) {
        this.vehicleId = vehicleId;
        this.model = model;
        this.availability = availability;
        this.pricePerDay = pricePerDay;
        this.imageUrl = imageUrl;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
