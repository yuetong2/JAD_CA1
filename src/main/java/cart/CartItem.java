package cart;

public class CartItem {
    private String serviceName;
    private String serviceId;
    private double price;
    private String date;
    private String startTime;
    private String address;
    private String contact;
    private String specialRequest;

    // Constructor
    public CartItem(String serviceName, String serviceId, double price, String date, String startTime, 
                    String address, String contact, String specialRequest) {
        this.serviceName = serviceName;
        this.serviceId = serviceId;
        this.price = price;
        this.date = date;
        this.startTime = startTime;
        this.address = address;
        this.contact = contact;
        this.specialRequest = specialRequest;
    }

    // Getter methods for all the attributes
    public String getServiceName() {
        return serviceName;
    }

    public String getServiceId() {
        return serviceId;
    }

    public double getPrice() {
        return price;
    }

    public String getDate() {
        return date;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getAddress() {
        return address;
    }

    public String getContact() {
        return contact;
    }

    public String getSpecialRequest() {
        return specialRequest;
    }
}
